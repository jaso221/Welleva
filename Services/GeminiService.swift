//
//  GeminiService.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import Foundation

class GeminiService {
    // ─────────────────────────────────────────────────────────────────────────
    // REPLACE this with your Google AI Studio key → https://aistudio.google.com/apikey
    // The key must start with AIzaSy. The Firebase key does NOT work here.
    // ─────────────────────────────────────────────────────────────────────────
    private let apiKey = "AQ.Ab8RN6KrQh-9FxAXc24lIrh0_OfQkYvpOZyZjOrUdGFY0wU2lw"
    private let endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent"

    func checkContent(_ text: String) async -> (verdict: String, explanation: String) {
        let prompt = """
        You are Josea, a friendly AI safety assistant helping an elderly person check if a message is a scam.

        Analyse the message below and decide: is this a scam attempt or is it safe?
        - Choose "Likely Scam" if the message asks for money, personal details, passwords, clicks on suspicious links, or creates urgency/fear.
        - Choose "Safe" if it is a normal message from a real person or legitimate service.
        - Only choose "Unverified" if there is genuinely not enough text to make any judgment.

        Respond in exactly this format with no extra text:
        VERDICT: [Likely Scam or Safe or Unverified]
        EXPLANATION: [One plain English sentence a grandmother would understand, avoid words like phishing or malware]

        Message to check:
        \(text)
        """
        let result = await callGemini(prompt: prompt)
        if let result { return result }
        return keywordScamCheck(text)
    }

    func checkFakeInfo(_ text: String) async -> (verdict: String, explanation: String) {
        let prompt = """
        You are Josea, a friendly AI fact-checking assistant helping an elderly person verify whether information is true or false.

        Read the claim or message below and decide:
        - Choose "True" if the information is factually accurate and can be verified.
        - Choose "False" if the information is incorrect, fabricated, or a known myth.
        - Choose "Misleading" if it contains some truth but is taken out of context or exaggerated.
        - Only choose "Unverifiable" if it is a personal opinion or future prediction that cannot be fact-checked.

        Respond in exactly this format with no extra text:
        VERDICT: [True or False or Misleading or Unverifiable]
        EXPLANATION: [One plain English sentence a grandmother would understand]

        Information to check:
        \(text)
        """
        let result = await callGemini(prompt: prompt)
        if let result { return result }
        return keywordFakeInfoCheck(text)
    }

    // MARK: - Gemini API (returns nil on any failure)

    private func callGemini(prompt: String) async -> (verdict: String, explanation: String)? {
        guard let url = URL(string: "\(endpoint)?key=\(apiKey)") else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "contents": [["parts": [["text": prompt]]]],
            "generationConfig": ["temperature": 0.1, "maxOutputTokens": 200]
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
                let code = (response as? HTTPURLResponse)?.statusCode ?? 0
                print("Gemini HTTP \(code): \(String(data: data, encoding: .utf8) ?? "")")
                return nil
            }

            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let candidates = json["candidates"] as? [[String: Any]],
               let content = candidates.first?["content"] as? [String: Any],
               let parts = content["parts"] as? [[String: Any]],
               let text = parts.first?["text"] as? String {
                print("Gemini raw: \(text)")
                return parseResponse(text)
            }
            return nil
        } catch {
            print("Gemini network error: \(error)")
            return nil
        }
    }

    private func parseResponse(_ raw: String) -> (verdict: String, explanation: String)? {
        var verdict = ""
        var explanation = ""

        for line in raw.components(separatedBy: "\n") {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            let upper = trimmed.uppercased()
            if upper.hasPrefix("VERDICT:") {
                verdict = String(trimmed.dropFirst("VERDICT:".count))
                    .trimmingCharacters(in: .whitespaces)
                    .replacingOccurrences(of: "**", with: "")
            } else if upper.hasPrefix("EXPLANATION:") {
                explanation = String(trimmed.dropFirst("EXPLANATION:".count))
                    .trimmingCharacters(in: .whitespaces)
                    .replacingOccurrences(of: "**", with: "")
            }
        }

        if verdict.isEmpty {
            for v in ["Likely Scam", "Safe", "True", "False", "Misleading", "Unverifiable", "Unverified"] {
                if raw.localizedCaseInsensitiveContains(v) { verdict = v; break }
            }
        }

        guard !verdict.isEmpty else { return nil }
        if explanation.isEmpty { explanation = "Please review this carefully and stay cautious." }
        return (verdict, explanation)
    }

    // MARK: - Local keyword fallbacks (run when API is unavailable)

    private func keywordFakeInfoCheck(_ text: String) -> (verdict: String, explanation: String) {
        let lower = text.lowercased()

        let knownFalse: [(String, String, String)] = [
            ("5g", "covid",     "This is a well-known false claim — 5G technology has no connection to COVID-19, which is caused by a virus."),
            ("vaccine", "microchip", "This is false — vaccines do not contain microchips of any kind."),
            ("vaccine", "tracking",  "This is false — there is no tracking technology in any approved vaccine."),
            ("earth", "flat",        "This is false — the Earth is scientifically proven to be a sphere."),
            ("bleach", "cure",       "This is false and dangerous — drinking bleach or any disinfectant does not cure illness."),
            ("lemon", "cancer",      "This is misleading — while a healthy diet supports wellbeing, no single food cures cancer."),
            ("covid", "hoax",        "This is false — COVID-19 is a real disease confirmed by health authorities worldwide."),
            ("bill gates", "vaccine","This is a false conspiracy theory — Bill Gates does not control vaccines or global health policy."),
            ("autism", "vaccine",    "This is false — extensive research has found no link between vaccines and autism."),
        ]

        for (kw1, kw2, explanation) in knownFalse {
            if lower.contains(kw1) && lower.contains(kw2) {
                return ("False", explanation)
            }
        }

        let misleadingPhrases = [
            "they don't want you to know", "mainstream media won't tell you",
            "doctors are hiding", "suppressed cure", "government is covering up",
            "secret study", "scientists admit", "what they're not telling you"
        ]
        if misleadingPhrases.contains(where: { lower.contains($0) }) {
            return ("Misleading", "This claim uses language designed to make you distrust official sources — always check reputable references before believing or sharing it.")
        }

        return ("Unverifiable", "We couldn't automatically verify this claim — please check a trusted source such as ABC News, Reuters, or health.gov.au before sharing.")
    }



    private func keywordScamCheck(_ text: String) -> (verdict: String, explanation: String) {
        let lower = text.lowercased()

        let highRiskPhrases = [
            "click here", "verify your account", "confirm your details", "your account has been",
            "suspended", "blocked", "unusual activity", "immediate action", "act now", "urgent",
            "limited time", "you have won", "you've won", "congratulations you", "claim your prize",
            "free gift", "send money", "wire transfer", "bitcoin", "cryptocurrency", "gift card",
            "itunes card", "google play card", "otp", "one-time password", "enter your password",
            "update your payment", "bank account", "tax refund", "ato", "mygov", "centrelink",
            "toll unpaid", "parcel held", "delivery failed", "medicare", "apple id suspended",
            "virus detected", "your device", "call this number", "do not ignore"
        ]

        let mediumRiskPhrases = [
            "click the link", "follow the link", "log in", "login", "sign in",
            "your password", "personal details", "social security", "tfn", "tax file",
            "refund", "outstanding payment", "overdue", "invoice attached"
        ]

        let highHits = highRiskPhrases.filter { lower.contains($0) }
        let mediumHits = mediumRiskPhrases.filter { lower.contains($0) }

        if highHits.count >= 2 || (highHits.count >= 1 && mediumHits.count >= 1) {
            let trigger = highHits.first ?? mediumHits.first ?? "suspicious content"
            return (
                "Likely Scam",
                "This message contains warning signs (like \"\(trigger)\") that are commonly used by scammers to trick people — do not click any links or share personal information."
            )
        } else if highHits.count == 1 {
            return (
                "Likely Scam",
                "This message has a red flag — \"\(highHits[0])\" is a phrase often used in scam messages. Be very cautious."
            )
        } else if mediumHits.count >= 2 {
            return (
                "Likely Scam",
                "This message asks for sensitive actions or information, which is a common tactic used by scammers."
            )
        } else {
            return (
                "Safe",
                "No obvious scam warning signs were detected in this message — it appears to be safe."
            )
        }
    }
}

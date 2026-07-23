//
//  GeminiService.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import FirebaseAI
import Foundation

class GeminiService {
    private let model = FirebaseAI.firebaseAI(backend: .googleAI()).generativeModel(modelName: "gemini-2.0-flash")

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

        do {
            let response = try await model.generateContent(prompt)
            let raw = response.text ?? ""
            print("Gemini raw response: \(raw)")
            return parseResponse(raw)
        } catch {
            print("Gemini error: \(error)")
            return ("Unverified", "Error: \(error.localizedDescription)")
        }
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

        do {
            let response = try await model.generateContent(prompt)
            let raw = response.text ?? ""
            print("Gemini fake info raw response: \(raw)")
            return parseResponse(raw)
        } catch {
            print("Gemini fake info error: \(error)")
            return ("Unverifiable", "Something went wrong checking this, please try again.")
        }
    }

    private func parseResponse(_ raw: String) -> (verdict: String, explanation: String) {
        var verdict = ""
        var explanation = ""

        let lines = raw.components(separatedBy: "\n")
        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            let upper = trimmed.uppercased()

            if upper.hasPrefix("VERDICT:") {
                verdict = trimmed
                    .dropFirst("VERDICT:".count)
                    .trimmingCharacters(in: .whitespaces)
                    .replacingOccurrences(of: "**", with: "")
            } else if upper.hasPrefix("EXPLANATION:") {
                explanation = trimmed
                    .dropFirst("EXPLANATION:".count)
                    .trimmingCharacters(in: .whitespaces)
                    .replacingOccurrences(of: "**", with: "")
            }
        }

        // Fallback: scan raw text for known verdict keywords if structured parse failed
        if verdict.isEmpty {
            let knownVerdicts = ["Likely Scam", "Safe", "True", "False", "Misleading", "Unverifiable", "Unverified"]
            for v in knownVerdicts {
                if raw.localizedCaseInsensitiveContains(v) {
                    verdict = v
                    break
                }
            }
        }

        if verdict.isEmpty { verdict = "Unverified" }
        if explanation.isEmpty { explanation = "We couldn't fully determine this — please be cautious." }

        return (verdict, explanation)
    }
}

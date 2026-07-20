//
//  GeminiService.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import FirebaseAI
import Foundation

class GeminiService {
    private let model = FirebaseAI.firebaseAI().generativeModel(modelName: "gemini-2.0-flash")

    func checkContent(_ text: String) async -> (verdict: String, explanation: String) {
        let prompt = """
        You are Josea, a calm and friendly AI safety assistant helping an elderly person check if something is a scam or misinformation.

        Analyse this message and respond in exactly this format, nothing else:
        VERDICT: [one of: Safe, Likely Scam, Unverified]
        EXPLANATION: [one short, plain language sentence explaining why, no jargon like "phishing" or "malware", explain the trick in simple terms]

        Message to check:
        \(text)
        """

        do {
            let response = try await model.generateContent(prompt)
            let raw = response.text ?? ""
            return parseResponse(raw)
        } catch {
            return ("Unverified", "Something went wrong checking this, please try again.")
        }
    }

    private func parseResponse(_ raw: String) -> (verdict: String, explanation: String) {
        var verdict = "Unverified"
        var explanation = "We couldn't fully check this, please be cautious."

        let lines = raw.components(separatedBy: "\n")
        for line in lines {
            if line.starts(with: "VERDICT:") {
                verdict = line.replacingOccurrences(of: "VERDICT:", with: "").trimmingCharacters(in: .whitespaces)
            }
            if line.starts(with: "EXPLANATION:") {
                explanation = line.replacingOccurrences(of: "EXPLANATION:", with: "").trimmingCharacters(in: .whitespaces)
            }
        }
        return (verdict, explanation)
    }
}

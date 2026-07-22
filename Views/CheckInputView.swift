//
//  CheckInputView.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import SwiftUI

struct CheckInputView: View {
    @Binding var currentPage: Int
    
    @State private var inputText: String = ""
    @State private var isChecking = false
    @State private var result: (verdict: String, explanation: String)?

    private let geminiService = GeminiService()
    private let firestoreService = FirestoreService()

    var body: some View {
        VStack(spacing: 24) {
            Text("Paste or type what you want to check")
                .font(.system(size: 18, weight: .medium))
                .padding(.top, 40)

            TextEditor(text: $inputText)
                .frame(height: 150)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 24)

            Button(action: runCheck) {
                Text(isChecking ? "Checking..." : "Check Now")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(Color(red: 0.85, green: 0.29, blue: 0.35))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .disabled(inputText.isEmpty || isChecking)
            .padding(.horizontal, 24)

            if let result = result {
                VStack(alignment: .leading, spacing: 8) {
                    Text(result.verdict)
                        .font(.system(size: 22, weight: .bold))
                    Text(result.explanation)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 24)
            }

            Spacer()
        }
    }

    private func runCheck() {
        isChecking = true
        Task {
            let checkResult = await geminiService.checkContent(inputText)
            await MainActor.run {
                self.result = checkResult
                self.isChecking = false
            }

            let scan = ScanResult(
                content: inputText,
                verdict: checkResult.verdict,
                explanation: checkResult.explanation,
                type: "message"
            )
            firestoreService.saveScanResult(scan)
        }
    }
}

#Preview {
    CheckInputView(currentPage: .constant(10))
}

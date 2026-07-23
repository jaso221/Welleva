//
//  ScamResultView.swift
//  Welleva
//
//  Created by Ojas Satarkar on 21/7/2026.
//

import SwiftUI

struct ScamResultView: View {
    @Binding var currentPage: Int
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var theme: AppTheme

    let verdict: String
    let explanation: String
    let originalText: String

    // Maps explanation keywords to the best matching lesson index in allLessons
    private var suggestedLessonIndex: Int {
        let lower = (verdict + " " + explanation).lowercased()
        if lower.contains("bank") || lower.contains("transfer") || lower.contains("account") { return 4 }  // Banking Scams
        if lower.contains("website") || lower.contains("link") || lower.contains("url") { return 3 }       // Fake Websites
        if lower.contains("call") || lower.contains("phone") || lower.contains("voice") { return 2 }       // Phone Call Scams
        if lower.contains("email") { return 1 }                                                             // Phishing Emails
        return 0                                                                                            // Fake Text Messages (default)
    }
    
    var verdictColor: Color {
        switch verdict {
        case "Safe": return .green
        case "Likely Scam": return .red
        default: return .orange
        }
    }
    
    var verdictIcon: String {
        switch verdict {
        case "Safe": return "checkmark.shield.fill"
        case "Likely Scam": return "exclamationmark.shield.fill"
        default: return "questionmark.circle.fill"
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {

            HStack {
                Button {
                    dismiss()
                } label: {
                    Image("IntroBack")
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)

            Spacer()
            
            Image(systemName: verdictIcon)
                .font(.system(size: 70))
                .foregroundStyle(verdictColor)
            
            Text(verdict)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(verdictColor)
            
            Text(explanation)
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                .padding(.horizontal, 30)
            
            Spacer()
            
            if verdict == "Likely Scam" {
                VStack(spacing: 10) {
                    Button {
                        theme.pendingLessonIndex = suggestedLessonIndex
                        dismiss()
                        currentPage = 11
                    } label: {
                        HStack {
                            Image(systemName: "book.fill")
                            Text("Learn to Spot This Scam")
                        }
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.redPink)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                    }

                    Text("Opens the relevant quiz in the Learning Centre")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
            }
            
            Button {
                dismiss()
            } label: {
                Text("Done")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.15))
                    .foregroundStyle(.primary)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    ScamResultView(
        currentPage: .constant(9),
        verdict: "Likely Scam",
        explanation: "This message pretends to be your bank asking for a code, real banks never ask for that over text.",
        originalText: "Sample scam text"
    )
    .environmentObject(AppTheme())
}

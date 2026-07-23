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
    
    let verdict: String
    let explanation: String
    let originalText: String
    
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
                Button {
                    dismiss()
                    currentPage = 11
                } label: {
                    Text("Explore Similar Scams")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.redPink)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
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
}

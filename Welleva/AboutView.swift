//
//  AboutView.swift
//  Welleva
//
//  Created by Aashna Gaikwad  on 16/7/2026.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                Image(systemName: "shield.checkered")
                    .font(.system(size: 70))
                    .foregroundStyle(.pink)
                    .padding(.top, 30)

                Text("About Welleva")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Your digital safety companion")
                    .font(.title3)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 18) {

                    aboutSection(
                        icon: "heart.fill",
                        title: "Our Purpose",
                        text: "Welleva helps Australians aged 70 and above recognise scams and misinformation while using technology more independently."
                    )

                    aboutSection(
                        icon: "checkmark.shield.fill",
                        title: "What We Do",
                        text: "The app checks suspicious messages, links and online content, then explains possible risks using clear and simple language."
                    )

                    aboutSection(
                        icon: "book.fill",
                        title: "Learn Safely",
                        text: "Users can learn from realistic scam examples, complete short lessons and improve their digital safety knowledge over time."
                    )

                    aboutSection(
                        icon: "lock.fill",
                        title: "Privacy",
                        text: "Welleva is designed to protect user privacy. Personal information should never be shared without permission."
                    )
                }

                Text("Welleva does not replace advice from banks, government agencies or emergency services.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("Version 1.0")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 30)
            }
            .padding(.horizontal, 24)
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func aboutSection(
        icon: String,
        title: String,
        text: String
    ) -> some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.pink)
                .frame(width: 35)

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)

                Text(text)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    NavigationStack {
        AboutView()
    }
}

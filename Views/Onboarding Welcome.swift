//
//  Onboarding Welcome.swift
//  Welleva
//
//  Created by Ojas Satarkar on 16/7/2026.
//

//
//  WelcomeView.swift
//  Welleva
//
//  Onboarding welcome screen
//

import SwiftUI

struct WelcomeView: View {
    // Change this to navigate to your next onboarding screen or main app
    @State private var showNextScreen = false

    private let brandRed = Color(red: 0.85, green: 0.29, blue: 0.35)

    var body: some View {
        VStack(spacing: 0) {

            Spacer().frame(height: 60)

            // MARK: - Title
            VStack(spacing: 4) {
                Text("Welcome to")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(.black)

                Text("SafeGuard")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(brandRed)
            }

            Text("Your digital companion for a\nsafer online experience")
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.top, 12)
                .padding(.horizontal, 24)

            Spacer()

            // MARK: - Shield illustration with floating icons
            ZStack {
                Circle()
                    .fill(brandRed.opacity(0.08))
                    .frame(width: 260, height: 260)

                Circle()
                    .fill(
                        LinearGradient(
                            colors: [brandRed, brandRed.opacity(0.85)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 170, height: 170)
                    .shadow(color: brandRed.opacity(0.35), radius: 20, x: 0, y: 12)

                Image(systemName: "shield.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 70, height: 70)

                // Floating help icon, top right
                FloatingIconBadge(systemName: "questionmark.circle.fill", tint: brandRed)
                    .offset(x: 100, y: -105)

                // Floating news/article icon, bottom left
                FloatingIconBadge(systemName: "text.badge.checkmark", tint: brandRed)
                    .offset(x: -105, y: 90)
            }
            .frame(height: 300)

            Spacer()

            // MARK: - Get Started button
            Button(action: {
                showNextScreen = true
            }) {
                HStack {
                    Text("Get Started")
                        .font(.system(size: 18, weight: .semibold))
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .semibold))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(
                    LinearGradient(
                        colors: [brandRed, brandRed.opacity(0.9)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: brandRed.opacity(0.35), radius: 14, x: 0, y: 8)
            }
            .padding(.horizontal, 24)
            .padding(.top, 8)

            // MARK: - Footer trust line
            HStack(spacing: 6) {
                Image(systemName: "globe")
                    .font(.system(size: 13))
                Text("End-to-end encrypted")
                    .font(.system(size: 13))

                Circle()
                    .fill(Color.secondary)
                    .frame(width: 3, height: 3)

                Image(systemName: "circle.lefthalf.filled")
                    .font(.system(size: 13))
                Text("Privacy focus")
                    .font(.system(size: 13))
            }
            .foregroundColor(.secondary)
            .padding(.top, 16)
            .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .fullScreenCover(isPresented: $showNextScreen) {
            // Replace with your actual next onboarding screen
            Text("Next screen goes here")
        }
    }
}

// MARK: - Small floating badge icon used around the shield
private struct FloatingIconBadge: View {
    let systemName: String
    let tint: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color(.systemBackground))
            .frame(width: 56, height: 56)
            .shadow(color: .black.opacity(0.12), radius: 10, x: 0, y: 6)
            .overlay(
                Image(systemName: systemName)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(tint)
            )
    }
}

#Preview {
    WelcomeView()
}

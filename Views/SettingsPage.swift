//
//  SettingPage.swift
//  Welleva
//
//  Created by Sichen Wang on 23/7/2026.
//
import SwiftUI

private let aboutURL   = URL(string: "https://site-4v9ywumfm.godaddysites.com/about-welleva")!
private let privacyURL = URL(string: "https://site-4v9ywumfm.godaddysites.com/privacy-policy")!

struct SettingsPage: View {

    @Binding var currentPage: Int
    @EnvironmentObject var authService: AuthService

    @State private var biometricsEnabled = true
    @State private var floatingWidgetEnabled = true
    @State private var notificationsEnabled = true
    @State private var allowAccessEnabled = true

    @State private var showFeedback  = false
    @State private var showFAQs      = false
    @State private var showTerms     = false

    var body: some View {

        VStack(spacing: 0) {

            TopBar(currentPage: $currentPage, title: "Settings")

            ScrollView {

                VStack(alignment: .leading, spacing: 25) {

                    // MARK: - ACCOUNT
                    SectionHeader(title: "MANAGE YOUR ACCOUNT")

                    Button {
                        authService.signOut()
                    } label: {
                        Text("Sign Out")
                            .foregroundStyle(Color.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(12)
                    }

                    Button { currentPage = 19 } label: {
                        SettingRow(title: "Update Account Details")
                            .foregroundStyle(.black)
                    }

                    Button { currentPage = 20 } label: {
                        SettingRow(title: "Set Up Biometrics", hasInfo: true)
                            .foregroundStyle(.black)
                    }

                    Button {} label: {
                        SettingRow(title: "Manage emergency contacts")
                            .foregroundStyle(.black)
                    }


                    // MARK: - PREFERENCES
                    SectionHeader(title: "PREFERENCES")

                    ToggleRow(title: "Turn on Biometrics", isOn: $biometricsEnabled)

                    ToggleRow(
                        title: "Floating Widget",
                        subtitle: "Toggle background Bubble On/Off",
                        hasInfo: true,
                        isOn: $floatingWidgetEnabled
                    )

                    ToggleRow(
                        title: "Manage Notifications",
                        subtitle: "We can tell you when a scam arrives",
                        hasInfo: true,
                        isOn: $notificationsEnabled
                    )


                    // MARK: - PRIVACY
                    SectionHeader(title: "PRIVACY")

                    // Opens Privacy Policy on website
                    Link(destination: privacyURL) {
                        VStack(alignment: .leading, spacing: 4) {
                            SettingRow(title: "Privacy Policy")
                            Text("See what we collect and how we use it")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                    }

                    ToggleRow(
                        title: "Allow Us to Access (Optional)",
                        subtitle: "You can turn this off at anytime",
                        hasInfo: true,
                        isOn: $allowAccessEnabled
                    )


                    // MARK: - ABOUT
                    SectionHeader(title: "ABOUT")

                    Button { showFAQs = true } label: {
                        SettingRow(title: "FAQs")
                            .foregroundStyle(.black)
                    }

                    Button { showFeedback = true } label: {
                        SettingRow(title: "Leave Feedback")
                            .foregroundStyle(.black)
                    }

                    Button { showTerms = true } label: {
                        SettingRow(title: "Terms of Use")
                            .foregroundStyle(.black)
                    }

                    // Opens About page on website
                    Link(destination: aboutURL) {
                        SettingRow(title: "About Welleva™")
                    }


                    // Footer
                    Text("© 2026 Welleva™ Group v1.0 alpha")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 30)
                }
                .padding()
            }

            TabBar(currentPage: $currentPage)
        }
        .sheet(isPresented: $showFeedback) { FeedbackSheet() }
        .sheet(isPresented: $showFAQs)     { FAQsSheet() }
        .sheet(isPresented: $showTerms)    { TermsSheet() }
    }
}

// MARK: - Feedback Sheet

struct FeedbackSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var feedbackText = ""
    @State private var submitted = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                if submitted {
                    VStack(spacing: 16) {
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.green)
                        Text("Thank you!")
                            .font(.title.bold())
                        Text("Your feedback helps us make Welleva better for everyone.")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    Text("We'd love to hear what you think about Welleva — any suggestions, bugs, or compliments are welcome.")
                        .foregroundStyle(.secondary)

                    TextEditor(text: $feedbackText)
                        .frame(minHeight: 180)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            Group {
                                if feedbackText.isEmpty {
                                    Text("Write your feedback here…")
                                        .foregroundStyle(.tertiary)
                                        .padding(14)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                        .allowsHitTesting(false)
                                }
                            }
                        )

                    Button {
                        submitted = true
                    } label: {
                        Text("Submit Feedback")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(feedbackText.isEmpty ? Color.gray : Color.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    .disabled(feedbackText.isEmpty)

                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Leave Feedback")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

// MARK: - FAQs Sheet

struct FAQsSheet: View {
    @Environment(\.dismiss) var dismiss

    private let faqs: [(String, String)] = [
        ("What is Welleva?",
         "Welleva is an anti-scam app designed to help Australians — especially older Australians — identify scam messages, fake news, and suspicious phone calls before any harm is done."),
        ("Is my data safe with Welleva?",
         "Yes. Welleva only stores the minimum information needed to provide the service. Your messages are analysed securely and are never sold to third parties. See our Privacy Policy for full details."),
        ("How does the scam checker work?",
         "You paste or screenshot a suspicious message and Welleva analyses it using AI and pattern recognition to determine whether it looks like a scam. You'll receive a clear verdict and explanation."),
        ("Does Welleva work without internet?",
         "Basic keyword-based scam detection works offline. The full AI analysis requires an internet connection."),
        ("What should I do if I've already been scammed?",
         "Contact your bank immediately if money was involved. Report the scam to Scamwatch at scamwatch.gov.au and to the Australian Cyber Security Centre at cyber.gov.au."),
        ("How do I improve my confidence score?",
         "Complete the lessons and quizzes in the Learning Centre. Each completed lesson adds 20 points to your Knowledge Confidence score."),
        ("Is Welleva free to use?",
         "Yes, Welleva is free to download and use. Some premium features may be introduced in future updates."),
        ("How do I contact support?",
         "Use the Leave Feedback option in Settings, or visit our website at welleva.com.au for contact details.")
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(faqs, id: \.0) { faq in
                    DisclosureGroup {
                        Text(faq.1)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(.vertical, 6)
                    } label: {
                        Text(faq.0)
                            .font(.subheadline.bold())
                            .padding(.vertical, 4)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("FAQs")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

// MARK: - Terms of Use Sheet

struct TermsSheet: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    Text("Last updated: July 2026")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    termsSection("1. Acceptance of Terms",
                        "By downloading or using Welleva, you agree to these Terms of Use. If you do not agree, please do not use the app.")

                    termsSection("2. Purpose of the App",
                        "Welleva is an informational tool designed to help users identify potential scams and misinformation. It does not provide legal, financial, or professional advice. Results from the scam checker are indicative only and should not be solely relied upon.")

                    termsSection("3. User Responsibilities",
                        "You agree to use Welleva only for lawful purposes. You must not misuse the app to harass others, submit false information, or attempt to reverse-engineer any part of the service.")

                    termsSection("4. Privacy",
                        "Our collection and use of personal information is governed by our Privacy Policy, available in the app and on our website. By using Welleva you consent to these practices.")

                    termsSection("5. Accuracy of Information",
                        "While we strive to provide accurate scam detection, Welleva cannot guarantee that all scam attempts will be identified, or that legitimate messages will never be flagged. Always use your own judgment and contact your bank or relevant authority if you are unsure.")

                    termsSection("6. Intellectual Property",
                        "All content, branding, and technology within Welleva is the property of Welleva Group. You may not copy, reproduce, or distribute any part of the app without written permission.")

                    termsSection("7. Limitation of Liability",
                        "To the extent permitted by Australian law, Welleva Group is not liable for any direct, indirect, or consequential loss arising from your use of the app, including loss resulting from acting on a scam detection result.")

                    termsSection("8. Changes to Terms",
                        "We may update these Terms from time to time. Continued use of the app after changes are posted constitutes your acceptance of the new Terms.")

                    termsSection("9. Governing Law",
                        "These Terms are governed by the laws of New South Wales, Australia. Any disputes shall be subject to the exclusive jurisdiction of the courts of New South Wales.")

                    termsSection("10. Contact",
                        "For questions about these Terms, contact us through the Feedback section in Settings or visit welleva.com.au.")
                }
                .padding()
            }
            .navigationTitle("Terms of Use")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }

    private func termsSection(_ heading: String, _ body: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(heading)
                .font(.subheadline.bold())
            Text(body)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

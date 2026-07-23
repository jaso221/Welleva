//
//  ReportScamView.swift
//  Welleva
//
import SwiftUI

struct ReportScamView: View {
    @Binding var currentPage: Int
    @EnvironmentObject var theme: AppTheme

    var body: some View {
        VStack(spacing: 0) {

            // Themed header with back button
            HStack {
                Button {
                    currentPage = 8
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                }
                Spacer()
                Text(theme.t("Report a Scam"))
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Color.clear.frame(width: 44, height: 44)
            }
            .padding(.horizontal)
            .background(theme.barBackground)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Info banner
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "megaphone.fill")
                                .foregroundColor(theme.primary)
                            Text("Report It — Protect Everyone")
                                .font(.headline)
                                .bold()
                        }
                        Text("If you've been targeted by a scam, report it immediately. Your report helps authorities track and shut down scammers.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(theme.primary.opacity(0.08))
                    .cornerRadius(16)

                    // Australian agencies
                    Text("🇦🇺  AUSTRALIA")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)

                    ReportingLinkCard(
                        title: "Scamwatch",
                        subtitle: "Operated by the ACCC — Australia's primary scam reporting hub",
                        icon: "shield.fill",
                        urlString: "https://www.scamwatch.gov.au/report-a-scam",
                        themeColor: theme.primary
                    )

                    ReportingLinkCard(
                        title: "ReportCyber",
                        subtitle: "Australian Cyber Security Centre — report cybercrime and online fraud",
                        icon: "lock.shield.fill",
                        urlString: "https://www.cyber.gov.au/report-and-recover/report",
                        themeColor: theme.primary
                    )

                    ReportingLinkCard(
                        title: "IDCARE",
                        subtitle: "Free identity & cyber security community service for Australians",
                        icon: "person.badge.shield.checkmark.fill",
                        urlString: "https://www.idcare.org/contact/contact-us",
                        themeColor: theme.primary
                    )

                    ReportingLinkCard(
                        title: "Australian Federal Police",
                        subtitle: "Report serious online crimes, fraud, and financial scams",
                        icon: "building.columns.fill",
                        urlString: "https://www.afp.gov.au/what-we-do/crime-types/fraud",
                        themeColor: theme.primary
                    )

                    // Lost money warning
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.orange)
                            Text("Lost Money?")
                                .font(.headline)
                                .bold()
                        }

                        Text("Contact your bank immediately to stop further transactions. Most Australian banks have a 24/7 fraud hotline.")
                            .font(.subheadline)
                            .foregroundColor(.primary)

                        Text("Do NOT use any phone number provided by the scammer — call the number on the back of your card or your bank's official website.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.orange.opacity(0.12))
                            .cornerRadius(10)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                    // International
                    Text("🌐  INTERNATIONAL")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)

                    ReportingLinkCard(
                        title: "FBI Internet Crime Complaint Center",
                        subtitle: "For US-related internet crimes and fraud (IC3)",
                        icon: "globe",
                        urlString: "https://www.ic3.gov",
                        themeColor: theme.primary
                    )

                    ReportingLinkCard(
                        title: "Action Fraud (UK)",
                        subtitle: "UK national reporting centre for fraud and cybercrime",
                        icon: "globe",
                        urlString: "https://www.actionfraud.police.uk/reporting-fraud-and-cyber-crime",
                        themeColor: theme.primary
                    )

                    Spacer(minLength: 20)
                }
                .padding()
            }

            TabBar(currentPage: $currentPage)
        }
    }
}

struct ReportingLinkCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let urlString: String
    let themeColor: Color

    var body: some View {
        if let url = URL(string: urlString) {
            Link(destination: url) {
                HStack(spacing: 14) {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 48, height: 48)
                        .background(themeColor)
                        .cornerRadius(12)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.primary)
                        Text(subtitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    }

                    Spacer()

                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(themeColor)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(14)
            }
        }
    }
}

#Preview {
    ReportScamView(currentPage: .constant(16))
        .environmentObject(AppTheme())
}

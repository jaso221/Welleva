//
//  DiscoverView.swift
//  Welleva
//
import SwiftUI

struct NewsArticle: Identifiable {
    let id = UUID()
    let title: String
    let source: String
    let date: String
    let summary: String
    let urlString: String
    let isAlert: Bool
}

struct DiscoverView: View {
    @Binding var currentPage: Int
    @EnvironmentObject var theme: AppTheme

    let articles: [NewsArticle] = [
        NewsArticle(
            title: "Australians Lost $2.74 Billion to Scams in 2024",
            source: "Scamwatch",
            date: "Jul 2026",
            summary: "The ACCC's Scamwatch report reveals record losses with investment scams and romance fraud on the rise.",
            urlString: "https://www.scamwatch.gov.au/news",
            isAlert: true
        ),
        NewsArticle(
            title: "AI Voice Cloning Scams Targeting Families",
            source: "ABC News",
            date: "Jul 2026",
            summary: "Scammers are using AI to clone the voices of family members, tricking people into sending money urgently.",
            urlString: "https://www.abc.net.au/news/topic/scams",
            isAlert: true
        ),
        NewsArticle(
            title: "Warning: Fake Toll SMS Messages Circulating",
            source: "Cyber.gov.au",
            date: "Jul 2026",
            summary: "Authorities warn of a surge in fake toll payment SMS messages designed to steal credit card details.",
            urlString: "https://www.cyber.gov.au/news",
            isAlert: false
        ),
        NewsArticle(
            title: "How to Spot a Deepfake Video Call Scam",
            source: "The Guardian",
            date: "Jun 2026",
            summary: "Experts share tips to identify when the person on a video call is AI-generated and not real.",
            urlString: "https://www.theguardian.com/australia-news/technology",
            isAlert: false
        ),
        NewsArticle(
            title: "Banking Impersonation Scams Up 45% This Year",
            source: "Sydney Morning Herald",
            date: "Jun 2026",
            summary: "Scammers posing as bank fraud departments have stolen hundreds of millions from Australians.",
            urlString: "https://www.smh.com.au",
            isAlert: false
        ),
        NewsArticle(
            title: "Social Media Job Scams Targeting Students",
            source: "ACCC",
            date: "Jun 2026",
            summary: "Students recruited as unwitting money mules through fake job ads on social media platforms.",
            urlString: "https://www.accc.gov.au",
            isAlert: false
        ),
    ]

    var body: some View {
        VStack(spacing: 0) {
            TopBar(currentPage: $currentPage, title: "Discover")

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // Active alert banner
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.white)
                            Text("Active Scam Alert")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.white)
                        }
                        Text("AI voice cloning scams are surging. Be careful of unexpected calls from 'family' urgently asking for money.")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(theme.primary)
                    .cornerRadius(16)

                    Text("LATEST NEWS")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)

                    ForEach(articles) { article in
                        NewsCard(article: article, themeColor: theme.primary)
                    }

                    Text("Stories sourced from Scamwatch, ABC News, Cyber.gov.au, and other reputable publications. Tap any card to read more.")
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top, 4)

                    Spacer(minLength: 20)
                }
                .padding()
            }

            TabBar(currentPage: $currentPage)
        }
    }
}

struct NewsCard: View {
    let article: NewsArticle
    let themeColor: Color

    var body: some View {
        if let url = URL(string: article.urlString) {
            Link(destination: url) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        if article.isAlert {
                            Label("Alert", systemImage: "exclamationmark.triangle.fill")
                                .font(.caption2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.orange)
                                .cornerRadius(6)
                        }
                        Spacer()
                        Text(article.date)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }

                    Text(article.title)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)

                    Text(article.summary)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(3)

                    HStack {
                        Text(article.source)
                            .font(.caption2)
                            .bold()
                            .foregroundColor(themeColor)
                        Spacer()
                        Image(systemName: "arrow.up.right")
                            .font(.caption2)
                            .foregroundColor(themeColor)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(14)
            }
        }
    }
}

#Preview {
    DiscoverView(currentPage: .constant(18))
        .environmentObject(AppTheme())
}

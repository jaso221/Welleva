//
//  DeviceView.swift
//  Welleva
//
import SwiftUI
import FirebaseAuth

struct DeviceView: View {
    @Binding var currentPage: Int
    @EnvironmentObject var theme: AppTheme

    @State private var scanHistory: [ScanResult] = []
    @State private var isLoadingHistory = true
    @State private var completedLessons: String = ""

    private static var storageKey: String {
        "completedLessons_\(Auth.auth().currentUser?.uid ?? "anon")"
    }

    private let firestoreService = FirestoreService()

    private var weeklyHistory: [ScanResult] {
        let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date()
        return scanHistory.filter { $0.timestamp >= oneWeekAgo }
    }

    private var completedCount: Int {
        completedLessons.isEmpty ? 0 : completedLessons.components(separatedBy: ",").count
    }
    private var confidenceScore: Int { min(completedCount * 20, 100) }

    var body: some View {
        VStack(spacing: 0) {
            TopBar(currentPage: $currentPage, title: "Device")

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Device protection status
                    VStack(spacing: 12) {
                        Image(systemName: "checkmark.shield.fill")
                            .font(.system(size: 52))
                            .foregroundColor(.green)
                        Text("Your Device is Protected")
                            .font(.title3).bold()
                        Text("No threats detected on this device")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(24)
                    .background(Color.green.opacity(0.08))
                    .cornerRadius(20)

                    // Knowledge confidence score
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "brain.head.profile")
                                .foregroundColor(theme.primary)
                            Text("Knowledge Confidence")
                                .font(.subheadline.bold())
                            Spacer()
                            Text("\(confidenceScore)%")
                                .font(.title3.bold())
                                .foregroundColor(confidenceScore >= 60 ? .green : confidenceScore >= 40 ? .orange : theme.primary)
                        }
                        ProgressView(value: Double(confidenceScore) / 100.0)
                            .tint(confidenceScore >= 60 ? .green : confidenceScore >= 40 ? .orange : theme.primary)
                        Text(confidenceScore == 0
                             ? "Complete lessons in the Learning tab to build your score."
                             : "\(completedCount) of 5 lessons completed — keep going!")
                            .font(.caption)
                            .foregroundColor(.gray)
                        if confidenceScore < 100 {
                            Button {
                                currentPage = 11
                            } label: {
                                Text("Go to Learning Centre →")
                                    .font(.caption.bold())
                                    .foregroundColor(theme.primary)
                            }
                        }
                    }
                    .padding()
                    .background(theme.primary.opacity(0.06))
                    .cornerRadius(16)

                    // User's personal scan history
                    HStack {
                        Text("YOUR CHECKS — LAST 7 DAYS")
                            .font(.caption).bold()
                            .foregroundColor(.gray)
                        Spacer()
                        if !weeklyHistory.isEmpty {
                            Text("\(weeklyHistory.count) checks")
                                .font(.caption).bold()
                                .foregroundColor(theme.primary)
                        }
                    }

                    if isLoadingHistory {
                        HStack { Spacer(); ProgressView(); Spacer() }
                            .padding()
                    } else if weeklyHistory.isEmpty {
                        VStack(spacing: 10) {
                            Image(systemName: "doc.text.magnifyingglass")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                            Text("No checks this week")
                                .font(.subheadline).bold()
                            Text("Use \"Scan a Message\" or \"Check Fake Info\" to start protecting yourself.")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(24)
                        .background(Color(.systemGray6))
                        .cornerRadius(16)
                    } else {
                        VStack(spacing: 10) {
                            ForEach(weeklyHistory) { result in
                                ScanHistoryRow(result: result, themeColor: theme.primary)
                            }
                        }
                    }

                    // National stats
                    Text("NATIONAL SCAM ACTIVITY — LAST 7 DAYS")
                        .font(.caption).bold()
                        .foregroundColor(.gray)

                    VStack(spacing: 14) {
                        DeviceStatRow(label: "Reports filed to Scamwatch", value: "14,230", valueColor: theme.primary)
                        Divider()
                        DeviceStatRow(label: "Losses reported nationally", value: "$52.1M", valueColor: .red)
                        Divider()
                        DeviceStatRow(label: "Phishing SMS blocked in AU", value: "830K+", valueColor: .orange)
                        Divider()
                        DeviceStatRow(label: "Fake websites taken down", value: "1,240", valueColor: .green)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                    // Top scam types
                    Text("TOP SCAM TYPES THIS WEEK")
                        .font(.caption).bold()
                        .foregroundColor(.gray)

                    VStack(spacing: 10) {
                        ScamTypeRow(rank: 1, type: "Investment Scams", change: "+12%", changeColor: .red)
                        Divider()
                        ScamTypeRow(rank: 2, type: "Phishing SMS / Smishing", change: "+8%", changeColor: .orange)
                        Divider()
                        ScamTypeRow(rank: 3, type: "Bank Impersonation", change: "+5%", changeColor: .orange)
                        Divider()
                        ScamTypeRow(rank: 4, type: "Job & Recruitment Fraud", change: "+3%", changeColor: theme.primary)
                        Divider()
                        ScamTypeRow(rank: 5, type: "Romance Scams", change: "-2%", changeColor: .green)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                    // Protection tips
                    Text("STAY PROTECTED")
                        .font(.caption).bold()
                        .foregroundColor(.gray)

                    HStack(spacing: 12) {
                        ProtectionTip(icon: "bell.badge.fill", title: "Enable Alerts", themeColor: theme.primary)
                        ProtectionTip(icon: "lock.fill", title: "Strong Passwords", themeColor: theme.primary)
                        ProtectionTip(icon: "eye.slash.fill", title: "Never Share OTPs", themeColor: theme.primary)
                    }

                    // Data source note
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "info.circle")
                            .foregroundColor(theme.primary)
                            .padding(.top, 2)
                        Text("National statistics sourced from Scamwatch (ACCC) and the Australian Cyber Security Centre. Updated weekly.")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(theme.primary.opacity(0.06))
                    .cornerRadius(14)

                    Spacer(minLength: 20)
                }
                .padding()
            }

            TabBar(currentPage: $currentPage)
        }
        .onAppear {
            completedLessons = UserDefaults.standard.string(forKey: Self.storageKey) ?? ""
            loadHistory()
        }
    }

    private func loadHistory() {
        isLoadingHistory = true
        firestoreService.fetchScanHistory { results in
            DispatchQueue.main.async {
                self.scanHistory = results
                self.isLoadingHistory = false
            }
        }
    }
}

struct ScanHistoryRow: View {
    let result: ScanResult
    let themeColor: Color

    private var verdictColor: Color {
        switch result.verdict {
        case "Safe": return .green
        case "Likely Scam": return .red
        default: return .orange
        }
    }

    private var verdictIcon: String {
        switch result.verdict {
        case "Safe": return "checkmark.circle.fill"
        case "Likely Scam": return "exclamationmark.triangle.fill"
        default: return "questionmark.circle.fill"
        }
    }

    private var formattedDate: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: result.timestamp, relativeTo: Date())
    }

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: verdictIcon)
                .font(.title2)
                .foregroundColor(verdictColor)
                .frame(width: 36)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(result.verdict)
                        .font(.subheadline).bold()
                        .foregroundColor(verdictColor)
                    Spacer()
                    Text(formattedDate)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }

                Text(result.content)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(2)

                Text(result.type.capitalized)
                    .font(.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(themeColor.opacity(0.12))
                    .foregroundColor(themeColor)
                    .cornerRadius(6)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(14)
    }
}

struct DeviceStatRow: View {
    let label: String
    let value: String
    let valueColor: Color

    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.primary)
            Spacer()
            Text(value)
                .font(.subheadline).bold()
                .foregroundColor(valueColor)
        }
    }
}

struct ScamTypeRow: View {
    let rank: Int
    let type: String
    let change: String
    let changeColor: Color

    var body: some View {
        HStack {
            Text("\(rank)")
                .font(.caption).bold()
                .foregroundColor(.gray)
                .frame(width: 20, alignment: .center)
            Text(type)
                .font(.subheadline)
            Spacer()
            Text(change)
                .font(.caption).bold()
                .foregroundColor(changeColor)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(changeColor.opacity(0.1))
                .cornerRadius(6)
        }
    }
}

struct ProtectionTip: View {
    let icon: String
    let title: String
    let themeColor: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 52, height: 52)
                .background(themeColor)
                .cornerRadius(14)
            Text(title)
                .font(.caption).bold()
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(14)
    }
}

#Preview {
    DeviceView(currentPage: .constant(17))
        .environmentObject(AppTheme())
}

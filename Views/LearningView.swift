import SwiftUI

struct LearningView: View {
    @Binding var currentPage: Int
    
    private let lessons = [
        Lesson(
            title: "Fake Text Messages",
            subtitle: "Learn how to spot suspicious SMS messages",
            icon: "message.fill",
            colour: .purple
        ),
        Lesson(
            title: "Phishing Emails",
            subtitle: "Recognise fake emails and dangerous links",
            icon: "envelope.fill",
            colour: .blue
        ),
        Lesson(
            title: "Phone Call Scams",
            subtitle: "Learn the warning signs of scam calls",
            icon: "phone.fill",
            colour: .green
        ),
        Lesson(
            title: "Fake Websites",
            subtitle: "Check whether a website looks trustworthy",
            icon: "globe",
            colour: .orange
        ),
        Lesson(
            title: "Banking Scams",
            subtitle: "Protect your money and personal details",
            icon: "creditcard.fill",
            colour: .pink
        )
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Learning Centre")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Build your confidence and learn how to stay safe online.")
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }

                    continueLearningCard

                    VStack(alignment: .leading, spacing: 14) {
                        Text("All Lessons")
                            .font(.title2)
                            .fontWeight(.bold)

                        ForEach(lessons) { lesson in
                            NavigationLink {
                                LessonDetailView()
                            } label: {
                                lessonCard(lesson)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
        }
    }

    private var continueLearningCard: some View {
        NavigationLink {
            LessonDetailView()
        } label: {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Continue Learning")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.9))

                        Text("Spotting Fake Text Messages")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }

                    Spacer()

                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 34))
                        .foregroundStyle(.white)
                }

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Progress")
                        Spacer()
                        Text("40%")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.white)

                    ProgressView(value: 0.4)
                        .tint(.white)
                }
            }
            .padding()
            .background(
                LinearGradient(
                    colors: [.purple, .indigo],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 22))
        }
        .buttonStyle(.plain)
    }

    private func lessonCard(_ lesson: Lesson) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(lesson.colour.opacity(0.15))
                    .frame(width: 54, height: 54)

                Image(systemName: lesson.icon)
                    .font(.title2)
                    .foregroundStyle(lesson.colour)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(lesson.title)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(lesson.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct Lesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let colour: Color
}

#Preview {
    LearningView(currentPage: .constant(11))
}

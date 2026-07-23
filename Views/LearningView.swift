//
//  LearningView.swift
//  Welleva
//
import SwiftUI
import FirebaseAuth

enum LearningDestination: Hashable {
    case detail(Lesson)
    case quiz(Lesson)
    case complete(Lesson)
}

struct LearningView: View {
    @Binding var currentPage: Int
    @EnvironmentObject var theme: AppTheme
    @State private var path = NavigationPath()
    @State private var completedLessons: String = ""

    private static var storageKey: String {
        "completedLessons_\(Auth.auth().currentUser?.uid ?? "anon")"
    }

    private var completedIndices: [Int] {
        completedLessons.isEmpty ? [] : completedLessons.components(separatedBy: ",").compactMap { Int($0) }
    }

    private var completedCount: Int { completedIndices.count }
    private var progressValue: Double { Double(completedCount) / Double(allLessons.count) }
    private var progressPercent: Int { Int(progressValue * 100) }

    private var nextLesson: Lesson {
        for (i, lesson) in allLessons.enumerated() {
            if !completedIndices.contains(i) { return lesson }
        }
        return allLessons[0]
    }

    var body: some View {
        VStack(spacing: 0) {
            TopBar(currentPage: $currentPage, title: "Learning")

            NavigationStack(path: $path) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Learning Centre")
                                .font(.title2.bold())
                            Text("Build your confidence and learn how to stay safe online.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.horizontal)

                        continueLearningCard

                        VStack(alignment: .leading, spacing: 14) {
                            Text("All Lessons")
                                .font(.title3.bold())
                                .padding(.horizontal)

                            ForEach(allLessons) { lesson in
                                Button {
                                    path.append(LearningDestination.detail(lesson))
                                } label: {
                                    lessonCard(lesson)
                                }
                                .buttonStyle(.plain)
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .background(Color(.systemGroupedBackground))
                .toolbar(.hidden, for: .navigationBar)
                .onAppear {
                    completedLessons = UserDefaults.standard.string(forKey: Self.storageKey) ?? ""
                    // Deep-link from ScamResultView "Learn More" button
                    let idx = theme.pendingLessonIndex
                    if idx >= 0, idx < allLessons.count {
                        theme.pendingLessonIndex = -1
                        path.append(LearningDestination.quiz(allLessons[idx]))
                    }
                }
                .navigationDestination(for: LearningDestination.self) { destination in
                    switch destination {
                    case .detail(let lesson):
                        LessonDetailView(lesson: lesson, path: $path)
                    case .quiz(let lesson):
                        QuizView(lesson: lesson, path: $path)
                    case .complete(let lesson):
                        LessonCompleteView(lesson: lesson, path: $path)
                    }
                }
            }

            TabBar(currentPage: $currentPage)
        }
    }

    private var continueLearningCard: some View {
        Button {
            path.append(LearningDestination.detail(nextLesson))
        } label: {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(completedCount == allLessons.count ? "All Lessons Complete!" : "Continue Learning")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.9))
                        Text(nextLesson.title)
                            .font(.title3.bold())
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Image(systemName: completedCount == allLessons.count ? "checkmark.circle.fill" : "arrow.right.circle.fill")
                        .font(.system(size: 34))
                        .foregroundStyle(.white)
                }

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Progress")
                        Spacer()
                        Text("\(completedCount) of \(allLessons.count) lessons — \(progressPercent)%")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.white)

                    ProgressView(value: progressValue)
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
        .padding(.horizontal)
    }

    private func lessonCard(_ lesson: Lesson) -> some View {
        HStack(spacing: 16) {
            Image(systemName: lesson.icon)
                .font(.title2)
                .foregroundStyle(lesson.iconColor)
                .frame(width: 54, height: 54)
                .background(lesson.iconBackground)
                .clipShape(Circle())

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

#Preview {
    LearningView(currentPage: .constant(11))
        .environmentObject(AppTheme())
}

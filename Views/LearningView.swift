//
//  LearningView.swift
//  Welleva
//
import SwiftUI

enum LearningDestination: Hashable {
    case detail(Lesson)
    case quiz(Lesson)
    case complete(Lesson)
}

struct LearningView: View {
    @Binding var currentPage: Int
    @EnvironmentObject var theme: AppTheme
    @State private var path = NavigationPath()

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
            path.append(LearningDestination.detail(allLessons[0]))
        } label: {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Continue Learning")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.9))
                        Text("Spotting Fake Text Messages")
                            .font(.title3.bold())
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

//
//  LessonDetailView.swift
//  Welleva
//
import SwiftUI

struct LessonDetailView: View {
    let lesson: Lesson
    @Binding var path: NavigationPath

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {

                // Icon + title header
                VStack(spacing: 16) {
                    Image(systemName: lesson.icon)
                        .font(.system(size: 48))
                        .foregroundStyle(lesson.iconColor)
                        .frame(width: 100, height: 100)
                        .background(lesson.iconBackground)
                        .clipShape(Circle())

                    Text(lesson.title)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)

                    Text(lesson.subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)

                // Introduction
                Text(lesson.introduction)
                    .font(.body)
                    .foregroundStyle(.secondary)

                // Warning Signs
                lessonSection(
                    title: "Warning Signs",
                    icon: "exclamationmark.triangle.fill",
                    items: lesson.warningSigns
                )

                // Safety Tips
                lessonSection(
                    title: "How to Stay Safe",
                    icon: "checkmark.shield.fill",
                    items: lesson.safetyTips
                )

                // Quiz button
                Button {
                    path.append(LearningDestination.quiz(lesson))
                } label: {
                    Text("Start Quick Quiz")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(lesson.iconColor)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding(22)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(lesson.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .navigationBar)
    }

    private func lessonSection(title: String, icon: String, items: [String]) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Label(title, systemImage: icon)
                .font(.title3.bold())

            ForEach(items, id: \.self) { item in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(lesson.iconColor)
                        .padding(.top, 2)
                    Text(item)
                        .font(.body)
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

#Preview {
    NavigationStack {
        LessonDetailView(lesson: allLessons[0], path: .constant(NavigationPath()))
    }
}

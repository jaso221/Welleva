//
//  LessonCompleteView.swift
//  Welleva
//
import SwiftUI

struct LessonCompleteView: View {
    let lesson: Lesson
    @Binding var path: NavigationPath

    private var lessonIndex: Int {
        (allLessons.firstIndex(of: lesson) ?? 0) + 1
    }

    var body: some View {
        VStack(spacing: 28) {
            Spacer()

            Image(systemName: "trophy.fill")
                .font(.system(size: 90))
                .foregroundStyle(.yellow)

            VStack(spacing: 10) {
                Text("Lesson Complete!")
                    .font(.largeTitle.bold())

                Text("You learned how to recognise common signs of \(lesson.title.lowercased()).")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            VStack(spacing: 12) {
                Text("+25 XP")
                    .font(.title.bold())
                    .foregroundStyle(lesson.iconColor)

                Text("Progress: \(lessonIndex) of \(allLessons.count) lessons complete")
                    .foregroundStyle(.secondary)

                ProgressView(value: Double(lessonIndex) / Double(allLessons.count))
                    .tint(lesson.iconColor)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(lesson.iconColor.opacity(0.10))
            .clipShape(RoundedRectangle(cornerRadius: 18))

            Spacer()

            Button {
                path = NavigationPath()
            } label: {
                Text("Back to Learning Centre")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(lesson.iconColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        LessonCompleteView(lesson: allLessons[0], path: .constant(NavigationPath()))
    }
}

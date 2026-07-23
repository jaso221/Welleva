//
//  LessonCompleteView.swift
//  Welleva
//
import SwiftUI
import FirebaseAuth

struct LessonCompleteView: View {
    let lesson: Lesson
    @Binding var path: NavigationPath

    @State private var completedLessons: String = ""

    // UserDefaults key scoped to the logged-in user so each account starts at 0
    private static var storageKey: String {
        "completedLessons_\(Auth.auth().currentUser?.uid ?? "anon")"
    }

    private var lessonIdx: Int { allLessons.firstIndex(of: lesson) ?? 0 }

    private var isFirstTimeComplete: Bool {
        !completed.contains(String(lessonIdx))
    }

    private var completed: [String] {
        completedLessons.isEmpty ? [] : completedLessons.components(separatedBy: ",")
    }

    private var completedCount: Int {
        var all = completed
        if !all.contains(String(lessonIdx)) { all.append(String(lessonIdx)) }
        return all.count
    }

    var confidenceScore: Int { min(completedCount * 20, 100) }

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
                if isFirstTimeComplete {
                    Text("+20 Confidence")
                        .font(.title.bold())
                        .foregroundStyle(lesson.iconColor)
                }

                Text("Progress: \(completedCount) of \(allLessons.count) lessons complete")
                    .foregroundStyle(.secondary)

                ProgressView(value: Double(completedCount) / Double(allLessons.count))
                    .tint(lesson.iconColor)

                HStack {
                    Text("Knowledge Confidence")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("\(confidenceScore)%")
                        .font(.caption.bold())
                        .foregroundStyle(lesson.iconColor)
                }
                ProgressView(value: Double(confidenceScore) / 100.0)
                    .tint(confidenceScore >= 60 ? .green : .orange)
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
        .onAppear {
            completedLessons = UserDefaults.standard.string(forKey: Self.storageKey) ?? ""
            var done = completed
            let key = String(lessonIdx)
            if !done.contains(key) {
                done.append(key)
                completedLessons = done.joined(separator: ",")
                UserDefaults.standard.set(completedLessons, forKey: Self.storageKey)
            }
        }
    }
}

#Preview {
    NavigationStack {
        LessonCompleteView(lesson: allLessons[0], path: .constant(NavigationPath()))
    }
}

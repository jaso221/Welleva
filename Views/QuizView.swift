//
//  QuizView.swift
//  Welleva
//
import SwiftUI

struct QuizView: View {
    let lesson: Lesson
    @Binding var path: NavigationPath

    @State private var selectedAnswer: String?  // "A" or "B"
    @State private var showFeedback = false

    var isCorrect: Bool { selectedAnswer == lesson.quizCorrectAnswer }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {

            Label(lesson.title, systemImage: lesson.icon)
                .font(.subheadline)
                .foregroundStyle(lesson.iconColor)

            Text("Quick Quiz")
                .font(.largeTitle.bold())

            Text(lesson.quizQuestion)
                .font(.title3)

            answerCard(label: "A", text: lesson.quizOptionA)
            answerCard(label: "B", text: lesson.quizOptionB)

            if showFeedback {
                feedbackCard
            }

            Spacer()

            if showFeedback && isCorrect {
                Button {
                    path.append(LearningDestination.complete(lesson))
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(lesson.iconColor)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            } else {
                Button {
                    guard selectedAnswer != nil else { return }
                    showFeedback = true
                } label: {
                    Text("Check Answer")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(selectedAnswer == nil ? Color.gray : lesson.iconColor)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .disabled(selectedAnswer == nil)
            }
        }
        .padding()
        .toolbar(.hidden, for: .navigationBar)
    }

    private func answerCard(label: String, text: String) -> some View {
        Button {
            selectedAnswer = label
            showFeedback = false
        } label: {
            HStack(alignment: .top, spacing: 14) {
                Image(systemName: selectedAnswer == label
                      ? "largecircle.fill.circle"
                      : "circle")
                    .foregroundStyle(lesson.iconColor)
                    .font(.title2)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Option \(label)")
                        .font(.headline)
                    Text(text)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.leading)
                }

                Spacer()
            }
            .padding()
            .background(
                selectedAnswer == label
                ? lesson.iconColor.opacity(0.12)
                : Color(.secondarySystemGroupedBackground)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }

    private var feedbackCard: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(isCorrect ? .green : .red)
                .font(.title2)

            VStack(alignment: .leading, spacing: 5) {
                Text(isCorrect ? "Correct!" : "Not quite")
                    .font(.headline)
                Text(isCorrect ? lesson.quizCorrectFeedback : lesson.quizIncorrectFeedback)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background((isCorrect ? Color.green : Color.red).opacity(0.10))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    NavigationStack {
        QuizView(lesson: allLessons[0], path: .constant(NavigationPath()))
    }
}

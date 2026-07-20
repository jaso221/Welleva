import SwiftUI

struct QuizView: View {
    @State private var selectedAnswer: String?
    @State private var showFeedback = false

    private let correctAnswer = "Message A"

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Quick Quiz")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Which message is most likely to be a scam?")
                .font(.title3)

            answerCard(
                title: "Message A",
                text: "Your bank account has been locked. Click this link immediately to verify your details."
            )

            answerCard(
                title: "Message B",
                text: "Hi Margaret, your doctor appointment is confirmed for 10:00 am tomorrow."
            )

            if showFeedback {
                feedbackCard
            }

            Spacer()

            if showFeedback && selectedAnswer == correctAnswer {
                NavigationLink {
                    LessonCompleteView()
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.purple)
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
                        .background(selectedAnswer == nil ? Color.gray : Color.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .disabled(selectedAnswer == nil)
            }
        }
        .padding()
        .navigationTitle("Quiz")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func answerCard(title: String, text: String) -> some View {
        Button {
            selectedAnswer = title
            showFeedback = false
        } label: {
            HStack(alignment: .top, spacing: 14) {
                Image(systemName: selectedAnswer == title
                      ? "largecircle.fill.circle"
                      : "circle")
                    .foregroundStyle(.purple)
                    .font(.title2)

                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.headline)

                    Text(text)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.leading)
                }

                Spacer()
            }
            .padding()
            .background(
                selectedAnswer == title
                ? Color.purple.opacity(0.12)
                : Color(.secondarySystemGroupedBackground)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }

    private var feedbackCard: some View {
        let isCorrect = selectedAnswer == correctAnswer

        return HStack(alignment: .top, spacing: 12) {
            Image(systemName: isCorrect
                  ? "checkmark.circle.fill"
                  : "xmark.circle.fill")
                .foregroundStyle(isCorrect ? .green : .red)
                .font(.title2)

            VStack(alignment: .leading, spacing: 5) {
                Text(isCorrect ? "Correct!" : "Not quite")
                    .font(.headline)

                Text(
                    isCorrect
                    ? "Message A uses urgency and asks you to click an unfamiliar link."
                    : "Look for urgent language and suspicious links. Try selecting Message A."
                )
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
        QuizView()
    }
}

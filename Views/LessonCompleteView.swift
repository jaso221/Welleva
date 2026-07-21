import SwiftUI

struct LessonCompleteView: View {
    var body: some View {
        VStack(spacing: 28) {
            Spacer()

            Image(systemName: "trophy.fill")
                .font(.system(size: 90))
                .foregroundStyle(.yellow)

            VStack(spacing: 10) {
                Text("Lesson Complete!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("You learned how to recognise common signs of fake text messages.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            VStack(spacing: 12) {
                Text("+25 XP")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.purple)

                Text("Progress: 1 of 5 lessons complete")
                    .foregroundStyle(.secondary)

                ProgressView(value: 0.2)
                    .tint(.purple)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple.opacity(0.10))
            .clipShape(RoundedRectangle(cornerRadius: 18))

            Spacer()

            NavigationLink {
                LearningView(currentPage: .constant(9))
            } label: {
                Text("Back to Learning Centre")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        LessonCompleteView()
    }
}

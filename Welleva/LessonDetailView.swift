import SwiftUI

struct LessonDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                Text("Spotting Fake Text Messages")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Read the example below and look for warning signs.")
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 14) {
                    Text("Australia Post")
                        .font(.headline)

                    Text("Your parcel could not be delivered. Please pay $2.95 using this link:")
                    
                    Text("auspost-delivery247.com")
                        .foregroundStyle(.blue)
                        .underline()

                    Text("Tap the link now to avoid your parcel being returned.")
                }
                .padding()
                .background(Color(.secondarySystemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 18))

                VStack(alignment: .leading, spacing: 16) {
                    Text("Warning Signs")
                        .font(.title2)
                        .fontWeight(.bold)

                    warningRow(
                        icon: "link.badge.plus",
                        title: "Suspicious website",
                        text: "The website address does not match the official Australia Post website."
                    )

                    warningRow(
                        icon: "clock.fill",
                        title: "Urgent language",
                        text: "The message pressures you to act immediately."
                    )

                    warningRow(
                        icon: "dollarsign.circle.fill",
                        title: "Unexpected payment",
                        text: "It asks for a small payment you were not expecting."
                    )
                }

                NavigationLink {
                    QuizView()
                } label: {
                    Text("Start Quick Quiz")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding()
        }
        .navigationTitle("Lesson")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func warningRow(
        icon: String,
        title: String,
        text: String
    ) -> some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.red)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)

                Text(text)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(Color.red.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    NavigationStack {
        LessonDetailView()
    }
}

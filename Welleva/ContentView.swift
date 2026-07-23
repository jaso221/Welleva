import SwiftUI

struct ContentView: View {

    @State private var currentPage: Int = 0
    @State private var userName: String = ""

    // Use the single AppTheme provided by WellevaApp instead of creating a duplicate.
    // This ensures TabBar / TabItem receive the same theme instance via the environment.
    @EnvironmentObject var theme: AppTheme
    @EnvironmentObject var authService: AuthService

    var body: some View {

        ZStack {
            switch currentPage {

            // MARK: - Onboarding & Auth
            case 0:  WelcomePage(currentPage: $currentPage)
            case 1:  IntroView(currentPage: $currentPage)
            case 2:  Intro1(currentPage: $currentPage)
            case 3:  Intro2(currentPage: $currentPage)
            case 4:  EncryptedView(currentPage: $currentPage)
            case 5:  PrivacyFirst(currentPage: $currentPage)
            case 6:  SignUp(currentPage: $currentPage, userName: $userName)
            case 7:  Login(currentPage: $currentPage, userName: $userName)

            // MARK: - Main app
            case 8:  HomePage(currentPage: $currentPage, userName: $userName)
            case 9:  SettingsPage(currentPage: $currentPage)
            case 10: ScamCheckView(currentPage: $currentPage)
            case 11: LearningView(currentPage: $currentPage)

            // MARK: - Settings
            case 12: TranslateSetting(currentPage: $currentPage)
            case 13: SizeSetting(currentPage: $currentPage)
            case 14: ColourSetting(currentPage: $currentPage, userName: $userName)

            // MARK: - Secondary features
            case 15: CheckInputView(currentPage: $currentPage)
            case 16: PlaceholderPage(title: "Report Scam", currentPage: $currentPage)
            case 17: PlaceholderPage(title: "Device", currentPage: $currentPage)
            case 18: PlaceholderPage(title: "Discover", currentPage: $currentPage)

            default: WelcomePage(currentPage: $currentPage)
            }
        }
        .onAppear {
            if authService.isSignedIn {
                currentPage = 8
            }
        }
        .onChange(of: authService.isSignedIn) { wasSignedIn, signedIn in
            if signedIn {
                currentPage = 8
            } else if wasSignedIn {
                currentPage = 0
            }
        }
    }
}

struct PlaceholderPage: View {
    let title: String
    @Binding var currentPage: Int

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text(title).font(.largeTitle).bold()
            Text("Coming soon").foregroundStyle(.secondary)
            Spacer()
            Button {
                currentPage = 8
            } label: {
                Text("Back to Home")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthService())
        .environmentObject(AppTheme())
}

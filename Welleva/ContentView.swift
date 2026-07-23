
import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var currentPage: Int = 0
    @State private var userName: String = ""
    @StateObject var theme = AppTheme()
    
    var body: some View {
        
        ZStack{
            
            switch currentPage{
            case 0: WelcomePage(currentPage: $currentPage)
            case 1: IntroView(currentPage: $currentPage)
            case 2: Intro1(currentPage: $currentPage)
            case 3: Intro2(currentPage: $currentPage)
            case 4: EncryptedView(currentPage: $currentPage)
            case 5: PrivacyFirst(currentPage: $currentPage)
            case 6: SignUp(currentPage: $currentPage, userName: $userName)
            case 7: Login(currentPage: $currentPage, userName: $userName)
            case 8: HomePage(currentPage: $currentPage, userName: $userName)
            case 9: SettingsPage(currentPage: $currentPage)
                
            case 10: CheckInputView(currentPage: $currentPage)
            case 11: LearningView(currentPage: $currentPage)
                
            case 12: TranslateSetting(currentPage: $currentPage)
            case 13: SizeSetting(currentPage: $currentPage)
            case 14: ColourSetting(currentPage: $currentPage, userName: $userName)
                //            case 15: News()
                //            case 16: Report()
                //            case 17: Device()
                //            case 18: Discover()
                // case 19: UpdateAccount()
                
            default: WelcomePage(currentPage: $currentPage)
            }
        }
        .environmentObject(theme)
    }
}

#Preview {
    ContentView()
}


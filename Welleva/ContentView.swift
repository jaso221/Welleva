import SwiftUI

struct ContentView: View {
    @State private var currentPage: Int = 0
    
    var body: some View {
        ZStack{
            switch currentPage{
            case 0: WelcomePage(currentPage: $currentPage)
            case 1: IntroView(currentPage: $currentPage)
            case 2: Intro1(currentPage: $currentPage)
            case 3: Intro2(currentPage: $currentPage)
            case 4: EncryptedView(currentPage: $currentPage)
            case 5: PrivacyFirst(currentPage: $currentPage)
            case 6: Login(currentPage: $currentPage)
            case 7: SignUp(currentPage: $currentPage)
            case 8: Homepage(currentPage: $currentPage)
            case 9: LearningView(currentPage: $currentPage)
                
            default: WelcomePage(currentPage: $currentPage)
            }
        }
    }
}

#Preview {
    ContentView()
}


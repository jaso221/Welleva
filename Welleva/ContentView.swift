import SwiftUI

struct ContentView: View {
    
    @State private var currentPage: Int = 0
    @State private var userName: String = ""
    
    var body: some View {
        
            switch currentPage{
            case 0: WelcomePage(currentPage: $currentPage)
            case 1: IntroView(currentPage: $currentPage)
            case 2: Intro1(currentPage: $currentPage)
            case 3: Intro2(currentPage: $currentPage)
            case 4: EncryptedView(currentPage: $currentPage)
            case 5: PrivacyFirst(currentPage: $currentPage)
            case 6: SignUp(currentPage: $currentPage, username: $userName)
            case 7: Login(currentPage: $currentPage, userName: $userName)
            case 8:Homepage(currentPage: $currentPage, userName: $userName)
           
            case 10: CheckInputView(currentPage: $currentPage)
            case 11: LearningView(currentPage: $currentPage)
            
                
            default: WelcomePage(currentPage: $currentPage)
            }
    }
}

#Preview {
    ContentView()
}



//  ContentView.swift
//  Welleva
//
//  Created by Ojas Satarkar on 16/7/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPage = 0
    
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
                
            default : WelcomePage(currentPage: $currentPage)
            }
        }
        .animation(.easeInOut, value: currentPage)
    }
}

#Preview {
    ContentView()
}

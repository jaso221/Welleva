//
//  WellevaApp.swift
//  Welleva
//
//  Created by Ojas Satarkar on 16/7/2026.
//

import SwiftUI
import FirebaseCore

@main
struct WellevaApp: App {
    @StateObject var theme = AppTheme()
    @StateObject var authService = AuthService()

    init() {
        // Firebase must be configured once, before any Auth / Firestore / FirebaseAI call.
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(theme)
                .environmentObject(authService)
        }
    }
}

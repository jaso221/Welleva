//
//  WellevaApp.swift
//  Welleva
//
//  Created by Ojas Satarkar on 16/7/2026.
//

import SwiftUI

@main
struct WellevaApp: App {
    @StateObject var theme = AppTheme()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(theme)
        }
    }
}

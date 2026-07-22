//
//  SettingPage.swift
//  Welleva
//
//  Created by Sichen Wang on 23/7/2026.
//
import SwiftUI

struct SettingsPage: View {
    
    @Binding var currentPage: Int

    @State private var biometricsEnabled = true
    @State private var floatingWidgetEnabled = true
    @State private var notificationsEnabled = true
    @State private var allowAccessEnabled = true
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Top Bar
            TopBar(currentPage: $currentPage, title: "Settings")
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    // MARK: - ACCOUNT
                    SectionHeader(title: "MANAGE YOUR ACCOUNT")
                    
                    SettingRow(title: "Update Account Details")
                    SettingRow(title: "Set Up Biometrics", hasInfo: true)
                    SettingRow(title: "Manage emergency contacts")
                    
                    
                    // MARK: - PREFERENCES
                    SectionHeader(title: "PREFERENCES")
                    
                    ToggleRow(
                        title: "Turn on Biometrics",
                        isOn: $biometricsEnabled
                    )
                    
                    ToggleRow(
                        title: "Floating Widget",
                        subtitle: "Toggle background Bubble On/Off",
                        hasInfo: true,
                        isOn: $floatingWidgetEnabled
                    )
                    
                    ToggleRow(
                        title: "Manage Notifications",
                        subtitle: "We can tell you when a scam arrives",
                        hasInfo: true,
                        isOn: $notificationsEnabled
                    )
                    
                    
                    // MARK: - PRIVACY
                    SectionHeader(title: "PRIVACY")
                    
                    VStack(alignment: .leading, spacing: 4) {
                        SettingRow(title: "Manage Your Data")
                        
                        Text("See what you have shared with us")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    
                    ToggleRow(
                        title: "Allow Us to Access (Optional)",
                        subtitle: "You can turn this off at anytime",
                        hasInfo: true,
                        isOn: $allowAccessEnabled
                    )
                    
                    
                    // MARK: - ABOUT
                    SectionHeader(title: "ABOUT")
                    
                    SettingRow(title: "FAQs")
                    SettingRow(title: "Leave Feedback")
                    SettingRow(title: "Terms of Use")
                    SettingRow(title: "About Welleva™")
                    
                    
                    // Footer
                    Text("© 2026 Welleva™ Group v1.0 alpha")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 30)
                }
                .padding()
            }
            
            // TabBar
            TabBar(currentPage: $currentPage)
        }
    }
}


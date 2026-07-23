
//  TabBar.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//

import SwiftUI

struct TabBar: View {
    
    @EnvironmentObject var theme: AppTheme
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            
            Spacer()
            
            TabItem(icon: "Home", title: "Home", isActive: currentPage == 8)
                .onTapGesture { currentPage = 8 }
            
            Spacer()
            
            TabItem(icon: "Device", title: "Device", isActive: currentPage == 17)
                .onTapGesture { currentPage = 17 }
            
            Spacer()
            
            TabItem(icon: "Learning", title: "Learning", isActive: currentPage == 11)
                .onTapGesture { currentPage = 11 }
            
            Spacer()
            
            TabItem(icon: "Discover", title: "Discover", isActive: currentPage == 18)
                .onTapGesture { currentPage = 18 }
            
            Spacer()
        }
        .padding()
        .background(theme.barBackground)
    }
}

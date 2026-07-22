
//
//  TabItem.swift
//  Welleva
//
//  Created by Sichen Wang on 21/7/2026.
//
import SwiftUI
import Combine

struct TabItem: View {
    
    @EnvironmentObject var theme: AppTheme
    
    var icon: String
    var title: String
    var isActive: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(icon)
                .renderingMode(.template)
                .foregroundColor(isActive ? theme.primary : .gray)
            
            Text(title)
                .font(.caption)
                .foregroundColor(isActive ? theme.primary : .gray)
        }
    }
}

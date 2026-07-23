//
//  SizeSetting.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import SwiftUI

struct SizeSetting: View {
    
    @Binding var currentPage: Int
    
    @EnvironmentObject var theme: AppTheme
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TopBar(currentPage: $currentPage, title: "Adjust Size")
                .background(theme.barBackground)
            
            VStack(spacing: 20) {
                
                Text("Adjust Text Size")
                    .font(.headline)
                
                Text("This is how your messages and tips will look.")
                    .font(.system(size: theme.fontSize))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                VStack(spacing: 12) {
                    TextRow(title: "Small", type: .small)
                    TextRow(title: "Medium", type: .medium)
                    TextRow(title: "Large", type: .large)
                }
                
                Button {
                    currentPage = 8
                } label: {
                    Text("Save Changes")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(theme.primary)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            Spacer()
            
            TabBar(currentPage: $currentPage)
        }
    }
}

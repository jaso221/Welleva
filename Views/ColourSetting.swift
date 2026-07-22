
//
//  Colour.swift
//  Welleva
//
//  Created by Sichen Wang on 21/7/2026.
//
import SwiftUI
import Combine

struct ColourSetting: View {
    
    @Binding var currentPage: Int
    @Binding var userName: String
    
    @EnvironmentObject var theme: AppTheme
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TopBar(currentPage: $currentPage, title: "Adjust Colour")
                .background(theme.barBackground)
            
            VStack(spacing: 20) {
                
                Text("Choose Your Theme")
                    .font(.headline)
                
                Text("This is how your messages will look.")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                VStack(spacing: 12) {
                    
                    ColourRow(title: "Black", color: .black)
                    ColourRow(title: "Pink", color: Color("redPink"))
                    ColourRow(title: "Blue", color: .blue)
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
        .background(Color.white)
    }
}

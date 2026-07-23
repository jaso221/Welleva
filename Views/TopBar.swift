
//
//  TopBar.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import Combine
import SwiftUI

struct TopBar: View {
    
    @EnvironmentObject var theme: AppTheme
    @Binding var currentPage: Int
    var title: String
    
    var body: some View {
        
        HStack {
            
            Button {
                currentPage = 9
            } label: {
                Image("Setting")
            }
            
            Spacer()
            
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
            
            Spacer()
            
            HStack(spacing: 16) {
                
                Button { currentPage = 12 } label: {
                    Image("Translate")
                }
                
                Button { currentPage = 13 } label: {
                    Image("Size")
                }
                
                Button { currentPage = 14 } label: {
                    Image("Colour")
                }
            }
        }
        .padding()
        .background(theme.barBackground)
    }
}

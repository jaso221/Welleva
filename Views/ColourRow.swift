
//
//  ColourRow.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import SwiftUI
import Combine

struct ColourRow: View {
    
    @EnvironmentObject var theme: AppTheme
    
    var title: String
    var color: Color
    
    var body: some View {
        
        Button {
            theme.selectedColor = color
        } label: {
            
            HStack {
                Text(title)
                
                Spacer()
                
                Circle()
                    .stroke(Color.gray)
                    .frame(width: 20, height: 20)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

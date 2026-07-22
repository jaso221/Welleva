//
//  TextRow.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import SwiftUI

struct TextRow: View {
    let title: String
    let type: FontSize
    
    @EnvironmentObject var theme: AppTheme
    
    var isSelected: Bool{
        switch type {
        case .small: return theme.fontSize == 14
        case .medium: return theme.fontSize == 16
        case .large: return theme.fontSize == 20
        
        }
    }
    
    var body: some View{
        Button{
            theme.setFont(size: type)
        }label: {
            HStack{
                Text(title)
                
                Spacer()
                
                Circle()
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Circle()
                            .fill(theme.primary)
                            .frame(width: 12, height: 12)
                            .opacity(isSelected ? 1 : 0)
                    )
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

//
//  LanguageRow.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import SwiftUI

struct LanguageRow: View {
    
    let title: String
    @Binding var selectedLanguage: String
    
    var body: some View {
        
        Button {
            selectedLanguage = title
        } label: {
            
            HStack {
                Text(title)
                
                Spacer()
                
                Circle()
                    .stroke(Color.gray)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Circle()
                            .fill(selectedLanguage == title ? Color.red : Color.clear)
                            .padding(4)
                    )
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

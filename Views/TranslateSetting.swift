//
//  TranslateSetting.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import SwiftUI

struct TranslateSetting: View {
    
    @Binding var currentPage: Int
    
    @State private var selectedLanguage: String = "English"
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Top
            TopBar(currentPage: $currentPage, title: "Adjust Language")
            
            VStack(spacing: 20) {
                
                Text("Adjust Language")
                    .font(.headline)
                
                Text("Make reading easier for you")
                    .foregroundColor(.gray)
                
                // Preview
                Text("Hello, how can I help you?")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red)
                    )
                
                // Current Selection
                HStack {
                    Text("Language")
                    
                    Spacer()
                    
                    Text(selectedLanguage)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                
                // Language Options
                VStack(spacing: 12) {
                    
                    LanguageRow(
                        title: "English",
                        selectedLanguage: $selectedLanguage
                    )
                    
                    LanguageRow(
                        title: "Spanish",
                        selectedLanguage: $selectedLanguage
                    )
                    
                    LanguageRow(
                        title: "French",
                        selectedLanguage: $selectedLanguage
                    )
                }
                
                
                // Save Button
                Button {
                    currentPage = 8
                } label: {
                    Text("Save Changes")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("redPink"))
                        .cornerRadius(10)
                }
                
                Button("Cancel") {
                    currentPage = 8
                }
                .foregroundColor(.gray)
            }
            .padding()
            
            Spacer()
            
            TabBar(currentPage: $currentPage)
        }
    }
}

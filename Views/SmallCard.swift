
//
//  SmallCard.swift
//  Welleva
//
//  Created by Sichen Wang on 21/7/2026.
//
import SwiftUI
struct SmallCard: View {
    
    var title: String
    var image: String
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Image(image)
            
            Text(title)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.08))
        .cornerRadius(20)
    }
}

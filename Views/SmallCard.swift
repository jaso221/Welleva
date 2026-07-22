//
//  SmallCard.swift
//  Welleva
//
//  Created by Sichen Wang on 21/7/2026.
//
import SwiftUI

struct SmallCard: View {
    var title: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 10){
            Image(icon)
                .resizable()
                .frame(width: 24, height: 24)
                .padding()
                .background(Color.pinn.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(title)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
}

#Preview {
    
}

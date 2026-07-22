//
//  TabItem.swift
//  Welleva
//
//  Created by Sichen Wang on 21/7/2026.
//
import SwiftUI

struct TabItem: View {
    var title: String
    var page: Int
    var icon: String
    @Binding var currentPage: Int
    
    var body: some View{
        Button{
            currentPage = page
        } label: {
            VStack(spacing: 4){
                
                Image(icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
}

//
//  EncryptedView.swift
//  Welleva
//
//  Created by Sichen Wang on 17/7/2026.
//
import SwiftUI


struct EncryptedView: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack{
            
            Button("Back"){
                currentPage = 0
            }
            
            Text("Encrypted Page")
        }
    }
}

#Preview {
    EncryptedView(currentPage: .constant(0))
}

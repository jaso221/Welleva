//
//  IntroView.swift
//  Welleva
//
//  Created by Sichen Wang on 17/7/2026.
//

import SwiftUI

struct IntroView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       
        VStack{
            
            VStack{
                Button(action: {
                    dismiss()
                }) {
                    Image("IntroBack")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(10)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        .offset(x: 0, y: -100)
                }
                }
            }
            
        }
        
    }

#Preview {
   IntroView()
}


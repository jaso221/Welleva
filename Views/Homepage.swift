//
//  Homepage.swift
//  Welleva
//
//  Created by Sichen Wang on 21/7/2026.
//
import SwiftUI

struct Homepage: View {
    @Binding var currentPage: Int
    
    var body: some View{
        
        VStack{
            
            Button("Learning"){
                currentPage = 9
            }
             Text("Homepage")
            
            
            }
        }
    }

//
//  Intro2.swift
//  Welleva
//
//  Created by Sichen Wang on 20/7/2026.
//
import SwiftUI

struct Intro2: View {
    @Binding var currentPage: Int
    
    var body: some View{
        Text("Helo")
    }
}

#Preview {
    Intro2(currentPage: .constant(3))
}

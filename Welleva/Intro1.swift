//
//  Intro1.swift
//  Welleva
//
//  Created by Sichen Wang on 20/7/2026.
//
import SwiftUI

struct Intro1: View {
    @Binding var currentPage: Int
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Intro1(currentPage: .constant(2))
}

//
//  SignUp.swift
//  Welleva
//
//  Created by Sichen Wang on 20/7/2026.
//
 import SwiftUI

struct SignUp: View {
    @Binding var currentPage: Int
    
    var body: some View {
        Text("Sign Up")
    }
}

#Preview {
    SignUp(currentPage: .constant(7))
}

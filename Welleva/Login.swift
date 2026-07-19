//
//  Login.swift
//  Welleva
//
//  Created by Sichen Wang on 20/7/2026.
//
import SwiftUI

struct Login: View {
    @Binding var currentPage: Int
    
    var body: some View {
        Text("Login")
    }
}

#Preview {
    Login(currentPage: .constant(0))
}

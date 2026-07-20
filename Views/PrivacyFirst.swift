//
//  PrivacyFirst.swift
//  Welleva
//
//  Created by Sichen Wang on 17/7/2026.
//

import SwiftUI

struct PrivacyFirst: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack{
            Button("Back"){
                currentPage = 0
            }
            Text("Privacy First")
        }
    }
}

#Preview {
    PrivacyFirst(currentPage: .constant(5))
}

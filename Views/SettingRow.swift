//
//  SettingRow.swift
//  Welleva
//
//  Created by Sichen Wang on 23/7/2026.
//
import SwiftUI

struct SettingRow: View {
    
    let title: String
    var hasInfo: Bool = false
    
    var body: some View {
        
        HStack {
            Text(title)
            
            Spacer()
            
            if hasInfo {
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

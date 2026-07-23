//
//  ToggleRow.swift
//  Welleva
//
//  Created by Sichen Wang on 23/7/2026.
//
import SwiftUI

struct ToggleRow: View {
    
    let title: String
    var subtitle: String? = nil
    var hasInfo: Bool = false
    
    @Binding var isOn: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            
            HStack {
                Text(title)
                
                Spacer()
                
                if hasInfo {
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                }
                
                Toggle("", isOn: $isOn)
                    .labelsHidden()
                    .tint(Color.pink)
            }
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

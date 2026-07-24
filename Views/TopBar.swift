
//
//  TopBar.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import Combine
import SwiftUI

struct TopBar: View {
    
    @EnvironmentObject var theme: AppTheme
    @Binding var currentPage: Int
    var title: String
    
    var body: some View {
        
        HStack {
            
            Button {
                currentPage = 9
            } label: {
                Image(systemName: "gearshape")
                    .font(.title2)
                    .foregroundColor(.white)
            }

            Spacer()

            Text(theme.t(title))
                .foregroundColor(.white)
                .font(.headline)

            Spacer()

            HStack(spacing: 16) {

                Button { currentPage = 12 } label: {
                    Image(systemName: "globe")
                        .font(.title2)
                        .foregroundColor(.white)
                }

                Button { currentPage = 13 } label: {
                    Image(systemName: "textformat.size")
                        .font(.title2)
                        .foregroundColor(.white)
                }

                Button { currentPage = 14 } label: {
                    Image(systemName: "paintpalette")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .background(theme.barBackground)
    }
}

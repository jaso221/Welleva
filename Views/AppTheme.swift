
//
//  AppTheme.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import SwiftUI
import Combine

class AppTheme: ObservableObject {
    
    @Published var selectedColor: Color = .black
    
    var primary: Color {
        selectedColor
    }
    
    var barBackground: Color {
        selectedColor
    }
    
    @Published var fontSize: CGFloat = 16
    
    func setFont(size: FontSize){
        switch size {
        case .small:
            fontSize = 14
        case.medium:
            fontSize = 16
        case .large:
            fontSize = 20
        }
    }
}

enum FontSize {
    case small, medium, large
}

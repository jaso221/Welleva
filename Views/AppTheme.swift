
//
//  AppTheme.swift
//  Welleva
//
//  Created by Sichen Wang on 22/7/2026.
//
import SwiftUI
import Combine

class AppTheme: ObservableObject {
    
    @Published var selectedColor: Color = .redPink
    
    var primary: Color {
        selectedColor
    }
    
    var barBackground: Color {
        selectedColor
    }
}

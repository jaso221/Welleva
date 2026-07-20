//
//  UserProfile.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import Foundation

struct UserProfile: Codable {
    var name: String
    var language: String = "English"
    var textSize: String = "Standard"   // Standard, Large, Extra Large
    var highContrast: Bool = false
    var trustedContactEmail: String?
}

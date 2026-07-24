
//
//  UserProfile.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import Foundation

struct UserProfile: Codable {
    var id: String
    
    var name: String
    var email: String
    var password: String
    var contactNumber: String
    var contactName: String
    
    var language: String = "English"
    var textSize: String = "Standard"   // Standard, Large, Extra Large
    var highContrast: Bool = false
    var trustedContactEmail: String?
}

struct ContactStorage {
    
    static func saveContact(for userId: String, name: String, number: String) {
        UserDefaults.standard.set(name, forKey: "contactName_\(userId)")
        UserDefaults.standard.set(number, forKey: "contactNumber_\(userId)")
    }
    
    static func loadContact(for userId: String) -> (name: String, number: String) {
        let name = UserDefaults.standard.string(forKey: "contactName_\(userId)") ?? ""
        let number = UserDefaults.standard.string(forKey: "contactNumber_\(userId)") ?? ""
        return (name, number)
    }
}

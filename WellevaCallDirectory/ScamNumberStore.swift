//
//  ScamNumberStore.swift
//  Welleva
//
//  Created by Ojas Satarkar on 21/7/2026.
//

import Foundation

struct ScamNumberStore {
    static let appGroupID = "group.com.OJASSAT.Welleva"
    static let key = "scamPhoneNumbers"

    static func saveNumbers(_ numbers: [String]) {
        let defaults = UserDefaults(suiteName: appGroupID)
        defaults?.set(numbers, forKey: key)
    }

    static func loadNumbers() -> [String] {
        let defaults = UserDefaults(suiteName: appGroupID)
        return defaults?.array(forKey: key) as? [String] ?? []
    }
}

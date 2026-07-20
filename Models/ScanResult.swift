
//
//  ScanResult.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import Foundation

struct ScanResult: Identifiable, Codable {
    var id: String = UUID().uuidString
    var content: String          // the message/text that was checked
    var verdict: String          // "Safe", "Likely Scam", "Unverified"
    var explanation: String      // plain language reason
    var type: String             // "message", "email", "social", "call"
    var timestamp: Date = Date()
}


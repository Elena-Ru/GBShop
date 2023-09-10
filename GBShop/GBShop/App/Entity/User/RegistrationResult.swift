//
//  RegistrationResult.swift
//  GBShop
//
//  Created by Елена Русских on 10.02.2023.
//

import Foundation

struct RegistrationResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}

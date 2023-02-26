//
//  AddReviewResult.swift
//  GBShop
//
//  Created by Елена Русских on 23.02.2023.
//

import Foundation

struct AddReviewResult: Codable {
    var result: Int
    var userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}

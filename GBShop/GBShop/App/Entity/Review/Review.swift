//
//  Review.swift
//  GBShop
//
//  Created by Елена Русских on 23.02.2023.
//

import Foundation

struct Review: Codable {
    var idComment: Int
    var text: String
    
    enum CodingKeys: String, CodingKey {
        case text
        case idComment = "id_comment"
    }
}

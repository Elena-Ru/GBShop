//
//  GoodByIdResult.swift
//  GBShop
//
//  Created by Елена Русских on 15.02.2023.
//

import Foundation

struct ProductByIdResult: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}

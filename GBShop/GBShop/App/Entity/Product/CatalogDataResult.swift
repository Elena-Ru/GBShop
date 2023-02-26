//
//  CatalogDataResult.swift
//  GBShop
//
//  Created by Елена Русских on 15.02.2023.
//

import Foundation

struct CatalogDataResult: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case price
        case id = "id_product"
        case name = "product_name"
    }
}

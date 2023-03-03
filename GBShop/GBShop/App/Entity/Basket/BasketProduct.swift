//
//  BasketModel.swift
//  GBShop
//
//  Created by Елена Русских on 03.03.2023.
//

import Foundation

struct BasketProduct: Codable {
    var product: ProductByIdResult
    var qty: Int
}

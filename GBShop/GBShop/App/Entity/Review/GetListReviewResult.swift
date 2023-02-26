//
//  GetListReviewResult.swift
//  GBShop
//
//  Created by Елена Русских on 23.02.2023.
//

import Foundation

struct GetListReviewResult: Codable {
    var pageNumber: Int
    var reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case reviews
        case pageNumber = "page_number"
    }
}

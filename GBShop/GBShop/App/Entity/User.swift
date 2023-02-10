//
//  User.swift
//  GBShop
//
//  Created by Елена Русских on 10.02.2023.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastName = "user_lastname"
    }
}

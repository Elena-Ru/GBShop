//
//  UserService.swift
//  GBShop
//
//  Created by Елена Русских on 16.03.2023.
//

import Foundation

protocol UserService {
    func save(name: String, email: String, password: String, creditCard: String, bio: String, id: Int, gender: String)
    
    func readInt(key: String) -> Int
    
    func readString(key: String) -> String
}

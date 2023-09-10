//
//  UserDefaultsService.swift
//  GBShop
//
//  Created by Елена Русских on 16.03.2023.
//

import Foundation

class UserDefaultsService: UserService {
    static let instance = UserDefaultsService()
    
    private init(){}
    
    func save(name: String, email: String, password: String, creditCard: String, bio: String, id: Int, gender: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(name, forKey: "name")
        userDefaults.set(password, forKey: "password")
        userDefaults.set(email, forKey: "email")
        userDefaults.set(creditCard, forKey: "creditCard")
        userDefaults.set(bio, forKey: "bio")
        userDefaults.set(id, forKey: "id")
        userDefaults.set(gender, forKey: "gender")
    }
    
    func readInt(key: String) -> Int {
        let userDefaults = UserDefaults.standard
        return userDefaults.integer(forKey: key)
    }
    
    func readString(key: String) -> String {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: key) ?? ""
        
    }
}

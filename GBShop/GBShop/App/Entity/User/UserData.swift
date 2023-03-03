//
//  UserData.swift
//  GBShop
//
//  Created by Елена Русских on 11.02.2023.
//

import Foundation

protocol UserData {
    var id: Int {get set}
    var name: String {get set}
    var password: String {get set}
    var email: String {get set}
    var gender: String {get set}
    var creditCard: String {get set}
    var bio: String {get set}
}

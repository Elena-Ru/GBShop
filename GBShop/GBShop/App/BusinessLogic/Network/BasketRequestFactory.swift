//
//  BasketRequestFactory.swift
//  GBShop
//
//  Created by Елена Русских on 03.03.2023.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func add(id: Int, qty: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}

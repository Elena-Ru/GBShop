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
    
    func remove(id: Int, completionHandler: @escaping(AFDataResponse<RemoveFromBasketResult>) -> Void)
    
    func payBasket(totalCost: Int, completionHandler: @escaping(AFDataResponse<PayBasketResult>) -> Void)
    
}

//
//  Basket.swift
//  GBShop
//
//  Created by Елена Русских on 03.03.2023.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://fast-wave-17602.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Basket: BasketRequestFactory {
    func payBasket(totalCost: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
        let requestModel = PayBasket(baseUrl: baseUrl, totalCost: totalCost)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func remove(id: Int, completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void) {
        let requestModel = RemoveFromBasket(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func add(id: Int, qty: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasket(baseUrl: baseUrl, id: id, qty: qty)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Basket {
    struct AddToBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket"
        let id: Int
        let qty: Int
        var parameters: Parameters? {
            return [
                "id_product": id,
                "quantity": qty
            ]
        }
    }
}

extension Basket {
    struct RemoveFromBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeFromBasket"
        let id: Int
        var parameters: Parameters? {
            return [
                "id_product": id,
            ]
        }
    }
}

extension Basket {
    struct PayBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "pay"
        let totalCost: Int
        var parameters: Parameters? {
            return [
                "cost_total": totalCost,
            ]
        }
    }
}

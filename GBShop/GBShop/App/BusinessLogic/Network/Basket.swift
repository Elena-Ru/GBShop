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
    
    func add(id: Int, qty: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasket(baseUrl: baseUrl, id: id, qty: qty)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
//    func getGoodById(id: Int, completionHandler: @escaping (AFDataResponse<ProductByIdResult>) -> Void) {
//        let requestModel = GetProduct(baseUrl: baseUrl, id: id)
//        self.request(request: requestModel, completionHandler: completionHandler)
//    }
//
//    func getCatalogData(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[CatalogDataResult]>) -> Void) {
//        let requestModel = CatalogData(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
//        self.request(request: requestModel, completionHandler: completionHandler)
//    }
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

//extension Products {
//    struct GetProduct: RequestRouter {
//        let baseUrl: URL
//        let method: HTTPMethod = .get
//        let path: String = "getGoodById"
//        let id: Int
//        var parameters: Parameters? {
//            return [
//                "id_product": id
//            ]
//        }
//    }
//}

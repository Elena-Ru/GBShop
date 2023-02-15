//
//  GoodsRequestFactory.swift
//  GBShop
//
//  Created by Елена Русских on 15.02.2023.
//

import Foundation
import Alamofire

protocol GoodsRequestFactory {
    func getCatalogData(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void)
    func getGoodById(id: Int, completionHandler: @escaping (AFDataResponse<ProductByIdResult>) -> Void)
}

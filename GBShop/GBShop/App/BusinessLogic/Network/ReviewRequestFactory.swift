//
//  ReviewRequestFactory.swift
//  GBShop
//
//  Created by Елена Русских on 22.02.2023.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    func removeReview(idComment: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
    
    func addReview(idUser: Int?, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}

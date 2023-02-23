//
//  Reviews.swift
//  GBShop
//
//  Created by Елена Русских on 22.02.2023.
//

import Foundation
import Alamofire

class Reviews: AbstractRequestFactory {
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

extension Reviews: ReviewRequestFactory {
    func addReview(idUser: Int?, text: String, completionHandler: @escaping (Alamofire.AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, id: idUser, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func removeReview(idComment: Int, completionHandler: @escaping (Alamofire.AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
        
    }
}

extension Reviews {
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview"
        let idComment: Int
        var parameters: Parameters? {
            return [
                "id_comment": idComment
            ]
        }
    }
}

extension Reviews {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview"
        let id: Int?
        let text: String
        var parameters: Parameters? {
            return [
                "id_user": id ?? 0,
                "text": text
            ]
        }
    }
}

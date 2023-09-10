//
//  DataRequest.swift
//  GBShop
//
//  Created by Елена Русских on 10.02.2023.
//

import Foundation
import Alamofire

protocol AbstractRequestFactory {
    var errorParser: AbstractErrorParser { get }
    var sessionManager: Session { get }
    var queue: DispatchQueue { get }
    @discardableResult
    
    func request<T: Decodable>( request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest
}

extension AbstractRequestFactory {
    @discardableResult
    
    public func request<T: Decodable>( request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest {
        return sessionManager
            .request(request)
            .responseCodable(errorParser: errorParser, queue: queue, completionHandler: completionHandler)
    }
}

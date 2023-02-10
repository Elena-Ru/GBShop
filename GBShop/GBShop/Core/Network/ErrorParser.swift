//
//  ErrorParser.swift
//  GBShop
//
//  Created by Елена Русских on 10.02.2023.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
    {
        return error
    }
}

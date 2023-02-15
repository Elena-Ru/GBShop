//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Елена Русских on 14.02.2023.
//

import XCTest
import Alamofire
@testable import GBShop

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

final class ResponseCodableTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!
    var requestFactory: RequestFactory!
    
    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStub()
        requestFactory = RequestFactory()
    }
    override func tearDown() {
        super.tearDown()
        errorParser = nil
        requestFactory = nil
    }
    
    func testShouldDownloadAndParse() {
        AF.request("https://jsonplaceholder.typicode.com/posts/1").responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PostStub, AFError>) in
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_Auth_login_shouldLogin() {
        //Given
        let auth = requestFactory.makeAuthRequestFatory()
        let name = "Somebody"
        let password = "mypassword"
        var loginR : Int = 88
        
        //When
        auth.login(userName: name, password: password) { response in
            switch response.result {
            case .success(let login):
                loginR = login.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
        //Then
        XCTAssertEqual(1, loginR)
        XCTAssertNotEqual(0, loginR)
    }
    
    func test_Auth_login_shouldNotLoginWithEmptyName() {
        let auth = requestFactory.makeAuthRequestFatory()
        let name = ""
        let password = "mypassword"
        
        auth.login(userName: name, password: password) { response in
            switch response.result {
            case .success:
                XCTFail()
            case .failure:
                break
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_Auth_login_ShouldNotLoginWithEmptyPassword() {
        let auth = requestFactory.makeAuthRequestFatory()
        let name = "Name"
        let password = ""
        
        auth.login(userName: name, password: password) { response in
            switch response.result {
            case .success:
                XCTFail()
            case .failure:
                break
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
        
        
}

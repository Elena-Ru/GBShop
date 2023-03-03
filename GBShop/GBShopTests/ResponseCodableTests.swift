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
    
    //MARK: LOGIN TESTS
    func testAuthLoginShouldLogin() {
        let auth = requestFactory.makeAuthRequestFactory()
        let name = "Somebody"
        let password = "mypassword"
        var loginR : Int = 88
        
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
        XCTAssertEqual(1, loginR)
        XCTAssertNotEqual(0, loginR)
    }
    
    func testAuthLoginShouldNotLoginWithEmptyName() {
        let auth = requestFactory.makeAuthRequestFactory()
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
    
    func testAuthLoginShouldNotLoginWithEmptyPassword() {
        let auth = requestFactory.makeAuthRequestFactory()
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
    
    //MARK: LOGOUT TESTS
    func testAuthLogoutShouldLogout() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        var logoutResult = 88
        
        auth.logout(idUser: id) { response in
            switch response.result {
            case .success(let logout):
                logoutResult = logout.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, logoutResult)
        XCTAssertNotEqual(0, logoutResult)
    }
    
    //MARK: REGISTER TESTS
    func testAuthRegisterShouldRegister() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let username = "Somebody"
        let password = "mypassword"
        let email = "some@some.ru"
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        var logoutResult = 88
        
        auth.register(idUser: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
            switch response.result {
            case .success(let logout):
                logoutResult = logout.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, logoutResult)
        XCTAssertNotEqual(0, logoutResult)
    }
    
    func testAuthRegisterShouldNotRegisterWithEmptyName() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let username = ""
        let password = "mypassword"
        let email = "some@some.ru"
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        
        auth.register(idUser: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
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
    
    func testAuthRegisterShouldNotRegisterWithEmptyPassword() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let username = "name"
        let password = ""
        let email = "some@some.ru"
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        
        auth.register(idUser: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
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
    
    func testAuthRegisterShouldNotRegisterWithEmptyEmail() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let username = "name"
        let password = "password"
        let email = ""
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        
        auth.register(idUser: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
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
    
    func testAuthRegisterShouldNotRegisterWithEmptyGender() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let username = "name"
        let password = "password"
        let email = "email"
        let gender = ""
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        
        auth.register(idUser: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
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
    
    func testAuthRegisterShouldNotRegisterWithEmptyCard() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let username = "name"
        let password = "password"
        let email = "email"
        let gender = "m"
        let creditCard = ""
        let bio = "This is good! I think I will switch to another language"
        
        auth.register(idUser: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
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
    
    //MARK: CHANGE DATA TESTS
    func testAuthRegisterShouldChangeData() {
        let auth = requestFactory.makeAuthRequestFactory()
        let id = 123
        let username = "Somebody"
        let password = "mypassword"
        let email = "some@some.ru"
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        var logoutResult = 88
        
        auth.changeUserData(idUser: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
            switch response.result {
            case .success(let logout):
                logoutResult = logout.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, logoutResult)
        XCTAssertNotEqual(0, logoutResult)
    }
    
    //MARK: PRODUCT TESTS
    func testProductsGetItemByIdShouldReturnItem() {
        let goods = requestFactory.makeGoodsRequestFactory()
        let id = 123
        var itemResult = 3
        
        goods.getGoodById(id: id) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, itemResult)
        XCTAssertNotEqual(0, itemResult)
    }
    
    func testProductsGetCatalogDataShouldReturnArray() {
        let products = requestFactory.makeGoodsRequestFactory()
        let pageNumber = 1
        let idCategory = 1
        
        var itemResult = 0
        
        products.getCatalogData(pageNumber: pageNumber, idCategory: idCategory) { response in
            switch response.result {
            case .success(let item):
                itemResult = item[0].id
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotEqual(0, itemResult)
    }
    
    //MARK: REVIEWS TESTS
    func testReviewRemoveReviewShouldRemoveReview() {
        let reviews = requestFactory.makeReviewsRequestFactory()
        let id = 123
        var itemResult = 3
        
        reviews.removeReview(idComment: id) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, itemResult)
        XCTAssertNotEqual(0, itemResult)
    }
    
    func testReviewAddReviewShouldAddReview() {
        let reviews = requestFactory.makeReviewsRequestFactory()
        let id = 123
        let text = "Good value of money"
        var itemResult = 3
        
        reviews.addReview(idUser: id, text: text) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, itemResult)
        XCTAssertNotEqual(0, itemResult)
    }
    
    func testReviewGetListReviewShouldReturnArrayOfReview() {
        let reviews = requestFactory.makeReviewsRequestFactory()
        let id = 123
        let page = 1
        var itemResult = 0
        
        reviews.getListReview(page: page, idProduct: id) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.reviews[0].idComment
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotEqual(0, itemResult)
    }
    
    //MARK: BASKET TESTS
    func testBasketAddShouldReturn1() {
        let basket = requestFactory.makeBasketRequestFactory()
        let id = 123
        let qty = 5
        var itemResult = 3
        
        basket.add(id: id, qty: qty) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, itemResult)
        XCTAssertNotEqual(0, itemResult)
    }
    
    func testBasketRemoveShouldReturn1() {
        let basket = requestFactory.makeBasketRequestFactory()
        let id = 123
        var itemResult = 3
        
        basket.remove(id: 233) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, itemResult)
        XCTAssertNotEqual(0, itemResult)
    }
}

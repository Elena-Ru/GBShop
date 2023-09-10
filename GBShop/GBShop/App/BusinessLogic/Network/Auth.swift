//
//  Auth.swift
//  GBShop
//
//  Created by Елена Русских on 10.02.2023.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
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

extension Auth: AuthRequestFactory {
    func changeUserData(idUser: Int, username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = ChangeData(baseUrl: baseUrl, id: idUser, name: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func register(idUser: Int, username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void) {
        let requestModel = Register(baseUrl: baseUrl, id: idUser, name: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, id: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login"
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}

extension Auth {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout"
        let id: Int
        var parameters: Parameters? {
            return [
                "id_user": id
            ]
        }
    }
}

extension Auth {
    struct Register: RequestRouter, UserData {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "register"
        var id: Int
        var name: String
        var password: String
        var email: String
        var gender: String
        var creditCard: String
        var bio: String
        var parameters: Parameters? {
            return [
                "id_user": id,
                "user_name": name,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}

extension Auth {
    struct ChangeData: RequestRouter, UserData {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "changeUserData"
        var id: Int
        var name: String
        var password: String
        var email: String
        var gender: String
        var creditCard: String
        var bio: String
        var parameters: Parameters? {
            return [
                "id_user": id,
                "user_name": name,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}

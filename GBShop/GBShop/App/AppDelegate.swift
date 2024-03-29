//
//  AppDelegate.swift
//  GBShop
//
//  Created by Елена Русских on 07.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let auth = requestFactory.makeAuthRequestFactory()
//        let goods = requestFactory.makeGoodsRequestFactory()
//        let reviews = requestFactory.makeReviewsRequestFactory()
//        let basket = requestFactory.makeBasketRequestFactory()
//        var products = [BasketProduct]()
//
//        auth.login(userName: "Somebody", password: "mypassword") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        auth.logout(idUser: 2) { response in
//            switch response.result {
//            case .success(let logout):
//                print(logout)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        auth.register(idUser: 123, username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
//            switch response.result {
//            case .success(let register):
//                print(register)
//            case .failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
//
//        auth.changeUserData(idUser: 123, username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
//            switch response.result {
//            case .success(let changeUserData):
//                print(changeUserData)
//            case .failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
//
//        goods.getGoodById(id: 12) { response in
//            switch response.result {
//            case .success(let item):
//                print(item)
//            case .failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
//
//        goods.getCatalogData(pageNumber: 1, idCategory: 1) { response in
//            switch response.result {
//            case .success(let catalog):
//                print(catalog)
//            case.failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
//
//        reviews.removeReview(idComment: 2) { response in
//            switch response.result {
//            case .success(let result):
//                print(result)
//            case.failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
//
//        reviews.addReview(idUser: 123, text: "Good value of money") { response in
//            switch response.result {
//            case .success(let result):
//                print(result)
//            case.failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
//
//        reviews.getListReview(page: 1, idProduct: 23) { response in
//            switch response.result {
//            case .success(let result):
//                print(result)
//            case.failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
        
//        basket.add(id: 245, qty: 4) { response in
//            switch response.result {
//            case .success(let result):
//                print(result)
//            case.failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
//
//        basket.remove(id: 1245) { response in
//            switch response.result {
//            case .success(let result):
//                products = []
//                print(result)
//            case.failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
//
//        basket.payBasket(totalCost: 2323) { response in
//            switch response.result {
//            case .success(let result):
//                print(result)
//            case.failure(let error):
//                print(String(describing: error))
//                print(error.localizedDescription)
//            }
//        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}


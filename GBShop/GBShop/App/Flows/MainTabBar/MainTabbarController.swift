//
//  MainTabbarController.swift
//  GBShop
//
//  Created by Елена Русских on 13.03.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    

    private func generateTabBar() {
        viewControllers = [
            generateVC(UserViewController(), "User", UIImage(systemName: "person"))
        ].map{ UINavigationController(rootViewController: $0)}
    }
    
    private func generateVC(_ viewController: UIViewController, _ title: String, _ image: UIImage?) -> UIViewController {
        
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.navigationItem.title = title
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionX: CGFloat = 10.0
        let width = tabBar.bounds.width - positionX * 2
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.backgroundColor = #colorLiteral(red: 0.9616644979, green: 0.9566935897, blue: 0.9610925317, alpha: 1)

        tabBar.itemWidth = width / 6
        tabBar.itemPositioning = .centered
        tabBar.tintColor = UIColor.brandDarkGreen
        tabBar.unselectedItemTintColor = UIColor.lightGray
    }
}

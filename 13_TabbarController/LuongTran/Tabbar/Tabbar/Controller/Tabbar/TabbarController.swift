//
//  TabbarController.swift
//  Tabbar
//
//  Created by luong.tran on 22/09/2022.
//

import UIKit

final class BaseTabbarViewController: UITabBarController {
    
    private static var sharedTabbarManager: BaseTabbarViewController = {
        let tabbarManager = BaseTabbarViewController()
        return tabbarManager
    }()
    
    class func shared() -> BaseTabbarViewController {
        return sharedTabbarManager
    }
    
    func configTabbar() {
        let homeVC = HomeViewController()
        if #available(iOS 13.0, *) {
            homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        }
        let homeNavigationController = UINavigationController(rootViewController: homeVC)
        

        let mapVC = MapViewController()
        if #available(iOS 13.0, *) {
            mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map.fill"), tag: 1)
        }
        let mapNavigationController = UINavigationController(rootViewController: mapVC)

        let favoriteVC = FavoriteViewController()
        if #available(iOS 13.0, *) {
            favoriteVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.fill"), tag: 2)
        }
        let favoriteNavigationController = UINavigationController(rootViewController: favoriteVC)

        let profileVC = ProfileViewController()
        if #available(iOS 13.0, *) {
            profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 3)
        }
        let profileNavigationController = UINavigationController(rootViewController: profileVC)

        self.viewControllers = [homeNavigationController, mapNavigationController, favoriteNavigationController, profileNavigationController]
        self.tabBar.tintColor = .red
    }
}

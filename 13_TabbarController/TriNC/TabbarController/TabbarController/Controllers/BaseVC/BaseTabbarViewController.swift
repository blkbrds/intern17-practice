//
//  BaseTabbarViewController.swift
//  TabbarController
//
//  Created by tri.nguyen on 16/05/2022.
//

import UIKit

class BaseTabbarViewController: UITabBarController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbarView()
    }
    
    // MARK: - ConfigUI
    func configTabbarView() {
//      Home
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        homeNav.tabBarItem.badgeColor = .red
        homeNav.tabBarItem.badgeValue = "99"
        
        // Map
        let mapVC = MapViewController()
        let mapNav = UINavigationController(rootViewController: mapVC)
        mapNav.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map.fill"), tag: 1)
        
        // Favorites
        let favoritesVC = FavoritesViewController()
        let favortiesNav = UINavigationController(rootViewController: favoritesVC)
        favortiesNav.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 2)
        favortiesNav.tabBarItem.badgeColor = .red
        favortiesNav.tabBarItem.badgeValue = "22"
        
        // Profile
        let profileVC = ProfileViewController()
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        
//      Tabbar
        self.viewControllers = [homeNav, mapNav, favortiesNav, profileNav]
        self.tabBar.tintColor = .brown
        self.tabBar.barTintColor = .purple
        self.tabBar.backgroundColor = .purple
    }
}

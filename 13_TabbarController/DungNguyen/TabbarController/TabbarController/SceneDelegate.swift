//
//  SceneDelegate.swift
//  TabbarController
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    enum TypesScreen {
        case login
        case tabbar
    }

    var window: UIWindow?
    
    private func createTabbar() {
        // Home
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home-selected"))
        // Map
        let mapVC = MapViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "map"), selectedImage: UIImage(named: "map-selected"))
        // Favorites
        let favoritesVC = FavoritesViewController()
        let favoritesNavi = UINavigationController(rootViewController: favoritesVC)
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "star"), selectedImage: UIImage(named: "star-selected"))
        // Profile
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), selectedImage: UIImage(named: "user-selected"))
        //tabbar controller
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavi, mapNavi, favoritesNavi, profileNavi]
        tabbarController.tabBar.tintColor = .red
        
        window?.rootViewController = tabbarController
    }
    
    private func createLogin() {
        let loginVC = LoginViewController()
        let loginNavi = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = loginNavi
    }
    
    func changeScreen(type: TypesScreen) {
        switch type {
        case .login:
            createLogin()
        case .tabbar:
            createTabbar()
        }
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        changeScreen(type: .login)
    }
}


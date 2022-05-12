//
//  SceneDelegate.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Enum
    enum TypeScreen {
        case login
        case register
        case tabbar
    }
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        changeScreen(type: .tabbar)
    }
    
    // MARK: - Public Function
    func changeScreen(type: TypeScreen) {
        switch type {
        case .login:
            return createLogin()
        case .register:
            return registerScreen()
        case .tabbar:
            return createTabbar()
        }
    }
    
    // MARK: - Private Function
    private func createTabbar() {
        // Home
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
        
        // Tabbar
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNav, mapNav, favortiesNav, profileNav]
        tabbarController.tabBar.tintColor = .brown
        tabbarController.tabBar.barTintColor = .purple
        tabbarController.tabBar.backgroundColor = .purple
        window!.rootViewController = tabbarController
    }
    
    private func createLogin() {
        let loginVC = LoginViewController()
        let loginNav = BaseNavigationViewController(rootViewController: loginVC)
        window?.rootViewController = loginNav
    }
        
    private func registerScreen() {
        let registerVC = RegisterViewController()
        let registerNav = BaseNavigationViewController(rootViewController: registerVC)
        window?.rootViewController = registerNav
    }
}

// MARK: - Extention SceneDelegate
extension SceneDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected Tab : \(tabBarController.selectedIndex)")
    }
}

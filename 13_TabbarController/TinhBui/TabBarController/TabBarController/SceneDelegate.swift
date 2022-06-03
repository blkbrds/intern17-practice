//
//  SceneDelegate.swift
//  TabBarController
//
//  Created by Tinh Bui T. VN.Danang on 5/31/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Define
    enum TypeScreen {
        case login
        case tabbar
    }
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        
        chaneScreen(type: .login)
    }
    
    func createTabar() {
        
        let homeVC = HomeViewController()
        let homeNaVi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let messagesVC = MessagesViewController()
        let messNaVi = UINavigationController(rootViewController: messagesVC)
        messNaVi.tabBarItem = UITabBarItem(title: "mes", image: UIImage(named: "mes"), selectedImage: UIImage(named: "mess") )
        messNaVi.tabBarItem.badgeValue = "99"
        messNaVi.tabBarItem.badgeColor = .blue
        
        let friendVC = FrendsViewController()
        let freNaVi = UINavigationController(rootViewController: friendVC)
        friendVC.tabBarItem = UITabBarItem(title: "Friend", image: UIImage(named: "frie"), tag: 2)
        
        let profileVC = ProfileViewController()
        let proNaVi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "pro"), tag: 3)
        
        let tabbars = UITabBarController()
        tabbars.viewControllers = [homeNaVi, messNaVi, freNaVi, proNaVi]
        tabbars.tabBar.tintColor = .red
        window!.rootViewController = tabbars
    }
    
    // MARK: - Private functions
    private func createLogin() {
        let loginVc = LoginViewController()
        
        let loginNavi = BaseNavigationController(rootViewController: loginVc)
        window?.rootViewController = loginNavi
    }
    
    func chaneScreen(type: TypeScreen) {
        switch type {
        case .login:
            createLogin()
        case .tabbar:
            createTabar()
        }
    }
}

// MARK: - UITabBarControllerDelegate
extension SceneDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected Tab : \(tabBarController.selectedIndex)")
    }
}

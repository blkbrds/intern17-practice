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
        changeScreen(type: .login)
    }
    
    // MARK: - Public Function
    func changeScreen(type: TypeScreen) {
        switch type {
        case .login:
            return changeRootToLoginScreen()
        case .register:
            return changeRootToRegister()
        case .tabbar:
            return changeRootToTabbar()
        }
    }
    
    // MARK: - Private Function
    private func changeRootToTabbar() {
        let tabbarVC = BaseTabbarViewController()
        window?.rootViewController = tabbarVC
    }
    
    private func changeRootToLoginScreen() {
        let loginVC = LoginViewController()
        let loginNav = BaseNavigationViewController(rootViewController: loginVC)
        window?.rootViewController = loginNav
    }
        
    private func changeRootToRegister() {
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

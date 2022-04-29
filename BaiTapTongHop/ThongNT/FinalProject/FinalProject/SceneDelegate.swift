//
//  SceneDelegate.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/20/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST
import GoogleSignIn

enum UserStatus {
    case logined
    case logout
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var accsesToken: String?
    let tabbarController = UITabBarController()

    static var shared: SceneDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Cannot find scene delegate")
        }
        return scene
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        GIDSignIn.sharedInstance().clientID = "289035542897-e70buft3aq39fi624qsf7d75kurr3163.apps.googleusercontent.com"
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        setRootView(with: .logout)
        window.makeKeyAndVisible()
    }

    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)
    }

    // Set root view of application when login
    func setRootView(with status: UserStatus) {
        switch status {
        case .logined:
            configTabbar()
            window?.rootViewController = tabbarController
        case .logout:
            window?.rootViewController = LoginViewController()
        }
    }

    private func configTabbar() {
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "play"), tag: 0)

        let viewControllers = [homeNavi]
        tabbarController.setViewControllers(viewControllers, animated: true)
        tabbarController.tabBar.isTranslucent = false
    }
}

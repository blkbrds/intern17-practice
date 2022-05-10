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

        LocationManager.shared().request()
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
        // HomeViewController
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "play"), tag: 0)

        // FavoriteViewController
        let favoriteVC = FavoriteViewController()
        favoriteVC.viewModel = FavoriteViewControllerModel()
        let favoriteNavi = UINavigationController(rootViewController: favoriteVC)
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "heart"), tag: 1)

        // MapViewController
        let mapVC = MapViewController()
        mapVC.viewModel = MapViewControllerModel()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 2)

        let viewControllers = [homeNavi, favoriteNavi, mapNavi]
        tabbarController.setViewControllers(viewControllers, animated: true)
        tabbarController.tabBar.isTranslucent = false
        tabbarController.selectedIndex = 2
    }
}

//
//  SceneDelegate.swift
//  ThucHanh
//
//  Created by tu.le2 on 20/07/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let homeVC = HomeViewController()
        let homeViewModel = HomeViewModel()
        homeVC.viewModel = homeViewModel
        let navi = UINavigationController(rootViewController: homeVC)
        
        window.rootViewController = navi
        
        self.window = window
        window.makeKeyAndVisible()

    }
}


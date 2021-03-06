//
//  SceneDelegate.swift
//  View_bai3
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/15/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = LoginViewController()
        self.window = window
        window.makeKeyAndVisible()
        window.backgroundColor = .white
    }
}


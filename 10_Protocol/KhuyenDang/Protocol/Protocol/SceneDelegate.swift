//
//  SceneDelegate.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let location = LocationViewController()
        let navi = UINavigationController(rootViewController: location)
        window.rootViewController = navi
        self.window = window
        window.makeKeyAndVisible()
        window.backgroundColor = .white
    }
}


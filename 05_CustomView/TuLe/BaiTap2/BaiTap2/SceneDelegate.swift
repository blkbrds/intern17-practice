//
//  SceneDelegate.swift
//  BaiTap2
//
//  Created by tu.le2 on 16/06/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = SliderViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}


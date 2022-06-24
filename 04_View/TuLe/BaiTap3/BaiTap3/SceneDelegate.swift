//
//  SceneDelegate.swift
//  BaiTap3
//
//  Created by tu.le2 on 12/06/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let vc = LoginViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}


//
//  SceneDelegate.swift
//  Draw
//
//  Created by tu.le2 on 21/06/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let vc = BT1ViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}


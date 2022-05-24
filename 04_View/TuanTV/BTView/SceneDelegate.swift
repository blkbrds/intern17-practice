//
//  SceneDelegate.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/21/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white
        let vc = BT2ViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

}


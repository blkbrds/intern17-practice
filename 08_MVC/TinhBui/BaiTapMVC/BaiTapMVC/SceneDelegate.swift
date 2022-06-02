//
//  SceneDelegate.swift
//  BaiTapMVC
//
//  Created by Tinh Bui T. VN.Danang on 5/6/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
             window = UIWindow(windowScene: windowScene)
             let vc = ViewController()
             window?.rootViewController = vc
             window?.makeKeyAndVisible()
    }
}


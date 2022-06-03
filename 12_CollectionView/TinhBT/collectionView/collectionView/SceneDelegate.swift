//
//  SceneDelegate.swift
//  collectionView
//
//  Created by Tinh Bui T. VN.Danang on 5/25/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
              window = UIWindow(windowScene: windowScene)
              let vc = Bai4ViewController()
        let navi = UINavigationController(rootViewController: vc)
              window?.rootViewController = navi
              window?.makeKeyAndVisible()
    }
}


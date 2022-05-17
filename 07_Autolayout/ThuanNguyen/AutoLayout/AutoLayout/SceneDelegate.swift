//
//  SceneDelegate.swift
//  AutoLayout
//
//  Created by thuan.nguyen on 13/05/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = Ex12ViewController()
        self.window = window
        window.makeKeyAndVisible()
    }

    


}


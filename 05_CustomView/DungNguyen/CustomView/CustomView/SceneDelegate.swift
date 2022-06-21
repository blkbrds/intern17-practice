//
//  SceneDelegate.swift
//  CustomView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/21/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = DatePickerViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}


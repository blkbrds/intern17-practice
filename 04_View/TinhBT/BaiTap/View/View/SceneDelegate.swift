//
//  SceneDelegate.swift
//  View
//
//  Created by Tinh Bui T. VN.Danang on 4/15/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let vc = SliderViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
     
    }

    func sceneWillResignActive(_ scene: UIScene) {
    
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
     
    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}


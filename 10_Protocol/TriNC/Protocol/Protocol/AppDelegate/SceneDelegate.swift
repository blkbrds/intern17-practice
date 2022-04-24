//
//  SceneDelegate.swift
//  Protocol
//
//  Created by tri.nguyen on 22/04/2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    enum ControllerType {
        case ex3
        case ex4
        case ex5
        
        var controller: UIViewController {
            switch self {
            case .ex3:
                return LocationViewController()
            case .ex4:
                return Ex4ViewController()
            case .ex5:
                return CalculatorViewController()
            }
        }
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let vc = ControllerType.ex3.controller
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}


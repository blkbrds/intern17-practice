//
//  SceneDelegate.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    enum ControllerType {
        case ex1
        case ex2
        case ex78
        case ex9
        case ex10
        case ex11
        case ex12
        
        var controller: UIViewController {
            switch self {
            case .ex1:
                return Exercise01ViewController()
            case .ex2:
                return Exercise02ViewController()
            case .ex78:
                return Exercise07ViewController()
            case .ex9:
                return Exercise09ViewController()
            case .ex10:
                return Exersice10ViewController()
            case .ex11:
                return Exercise11ViewController()
            case .ex12:
                return Exersice12ViewController()
            }
        }
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let vc = ControllerType.ex12.controller
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}


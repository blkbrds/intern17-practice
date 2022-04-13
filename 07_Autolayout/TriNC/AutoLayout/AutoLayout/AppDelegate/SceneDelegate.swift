//
//  SceneDelegate.swift
//  AutoLayout
//
//  Created by tri.nguyen on 13/04/2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    enum ControllerType {
        case ex1
        case ex11
        case ex2
        case ex22
        case ex3
        
        var controller: UIViewController {
            switch self {
            case .ex1: return Exercise01ViewController()
            case .ex11: return Exercise11ViewController()
            case .ex2: return Exercise02ViewController()
            case .ex22: return Exercise22ViewController()
            case .ex3: return Exercise03ViewController()
            }
        }
    }
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = ControllerType.ex3.controller
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }
}


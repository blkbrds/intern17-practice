//
//  SceneDelegate.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    enum ControllerType {
        case ex1
        case ex2
        case ex4
        case ex3
        case ex5
        case ex6
        case ex7
        case ex8
        
        var controller: UIViewController {
            switch self {
            case .ex1: return ExerciseAViewController()
            case .ex2: return LoginViewController()
            case .ex3: return HomieViewController()
            case .ex4: return ImageBackGroundViewController()
            case .ex5: return TintColorViewController()
            case .ex6: return SeachBarViewController()
            case .ex7: return BarButtonTestViewController()
            case .ex8: return MoreBarViewController()
            }
        }
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let vc = ControllerType.ex1.controller
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}


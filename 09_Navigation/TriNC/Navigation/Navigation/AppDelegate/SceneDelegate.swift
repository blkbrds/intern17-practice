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
        case ex5
        case ex6
        case ex7
        
        var controller: UIViewController {
            switch self {
            case .ex1: return ExerciseAViewController()
            case .ex2: return LoginViewController()
            case .ex4: return BackgroundViewController()
            case .ex5: return TintColorViewController()
            case .ex6: return SeachBarViewController()
            case .ex7: return MoreBarViewController()
            }
        }
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let vc = ControllerType.ex7.controller
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}


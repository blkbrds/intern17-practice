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
        case ex33
        case ex333
        case ex4
        case ex44
        case ex444
        case ex4444
        case ex44444
        case ex5
        case ex6
        case ex7
        case ex8
        case ex9
        case ex10
        case ex0011
        case ex12
        
        var controller: UIViewController {
            switch self {
            case .ex1: return Exercise01ViewController()
            case .ex11: return Exercise11ViewController()
            case .ex2: return Exercise02ViewController()
            case .ex22: return Exercise22ViewController()
            case .ex3: return Exercise03ViewController()
            case .ex33: return Exercise33ViewController()
            case .ex333: return Exercise333ViewController()
            case .ex4: return Exercise04ViewController()
            case .ex44: return Exercise44ViewController()
            case .ex444: return Exercise444ViewController()
            case .ex4444: return Exercise4444ViewController()
            case .ex44444: return Exercise44444ViewController()
            case .ex5: return Exercise05ViewController()
            case .ex6: return Exercise06ViewController()
            case .ex7: return Exercise07ViewController()
            case .ex8: return Exercise08ViewController()
            case .ex9: return Exercise09ViewController()
            case .ex10: return Exercise10ViewController()
            case .ex0011: return Exercise0011ViewController()
            case .ex12: return Exercise12ViewController()
            }
        }
    }
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = ControllerType.ex10.controller
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }
}


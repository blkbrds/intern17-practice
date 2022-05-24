//
//  AppDelegate.swift
//  ExecirseCustomView
//
//  Created by thuan.nguyen on 25/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let homeViewController = Ex4DateViewController()
        window?.rootViewController = homeViewController
        return true
    }

    


}


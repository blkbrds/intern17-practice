//
//  AppDelegate.swift
//  Demo
//
//  Created by Tinh Bui T. VN.Danang on 4/5/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let homeViewController = HomeViewController()
        window?.rootViewController = homeViewController
        // Override point for customization after application launch.
        return true
    }
}


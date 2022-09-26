//
//  AppDelegate.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: Bai5ViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }


}


//
//  AppDelegate.swift
//  BaiTap01
//
//  Created by Phong Huynh N. VN.Danang on 3/24/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame:  UIScreen.main.bounds)
        window?.backgroundColor = .white
        let vc = MyViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    


}


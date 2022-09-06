//
//  AppDelegate.swift
//  CustomView
//
//  Created by luong.tran on 23/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let bai1VC = Bai3ViewController()
        window?.rootViewController = bai1VC
        window?.makeKeyAndVisible()
        
        return true
    }


}


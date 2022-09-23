//
//  AppDelegate.swift
//  Tabbar
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Config window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let userDefaults = UserDefaults.standard
        if userDefaults.string(forKey: "email") != nil {
            changeRootToHome()
        } else {
            changeRootToLogin()
        }
        
        return true
    }
    
    func changeRootToHome() {
        let tabbarVC = BaseTabbarViewController()
        tabbarVC.configTabbar()
        window?.rootViewController = tabbarVC
    }
    
    func changeRootToLogin() {
        let navVC = UINavigationController()
        let coordinator = MainCoordinator()
        coordinator.navigationController = navVC
        window?.rootViewController = navVC
        coordinator.start()
    }

}

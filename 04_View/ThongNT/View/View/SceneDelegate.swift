//
//  SceneDelegate.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = configTabbar()
        window.makeKeyAndVisible()
    }
    
    private func configTabbar() -> UITabBarController {
        // MyViewController
        let myVC = MyViewController()
        let myNavi = UINavigationController(rootViewController: myVC)
        myNavi.tabBarItem = UITabBarItem(title: "View", image: UIImage(systemName: "house"), tag: 0)
        
        // CustomViewController
        let customVC = CustomViewController()
        let customNavi = UINavigationController(rootViewController: customVC)
        customNavi.tabBarItem = UITabBarItem(title: "Custom", image: UIImage(systemName: "pencil"), tag: 1)
        
        // TableViewController
        let tableVC = TableViewController()
        let tableNavi = UINavigationController(rootViewController: tableVC)
        tableNavi.tabBarItem = UITabBarItem(title: "Table", image: UIImage(systemName: "tablecells"), tag: 2)
        
        // CollectionViewController
        let collectionVC = CollectionViewController()
        let collectionNavi = UINavigationController(rootViewController: collectionVC)
        collectionNavi.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "bag"), tag: 3)
        
        // MapViewController
        let mapVC = MapViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 4)
        
        // NavigationViewController
        let naviVC = NavigationViewController()
        let naviNavi = UINavigationController(rootViewController: naviVC)
        naviNavi.tabBarItem = UITabBarItem(title: "Navi", image: UIImage(systemName: "arrow.up"), tag: 5)
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [myNavi, customNavi, tableNavi, collectionNavi, mapNavi, naviNavi]
        tabbarController.tabBar.tintColor = .systemPink
        return tabbarController
    }
}


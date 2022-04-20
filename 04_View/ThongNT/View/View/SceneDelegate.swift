//
//  SceneDelegate.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

enum ApplicationStatus {
    case logined
    case logout
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    static var shared: SceneDelegate {
        guard let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Can't find scence delegate")
        }
        return delegate
    }

    private let tabbarController = UITabBarController()
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        configTabbar()
        changeFlow(with: .logout)
        window.makeKeyAndVisible()
    }
    
    private func configTabbar() {
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
        
        // AutoLayoutViewController
        let autoLayoutVC = AutoLayoutViewController()
        let autoLayoutNavi = UINavigationController(rootViewController: autoLayoutVC)
        autoLayoutNavi.tabBarItem = UITabBarItem(title: "Auto Layout", image: UIImage(systemName: "map"), tag: 6)
            
        // Cofig Tapbar controller
        let viewControllers = [myNavi, customNavi, tableNavi, collectionNavi, mapNavi, naviNavi, autoLayoutNavi]
        tabbarController.setViewControllers(viewControllers, animated: true)
        tabbarController.tabBar.tintColor = .systemPink
        tabbarController.selectedIndex = 0
        tabbarController.tabBar.isTranslucent = false
    }
    
    func changeFlow(with status: ApplicationStatus) {
        switch status {
        case .logined:
            window?.rootViewController = tabbarController
        case .logout:
            let loginVC = LoginViewController()
            let loginNavi = UINavigationController(rootViewController: loginVC)
            window?.rootViewController = loginNavi
        }
    }
}

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    enum check {
        case tabbar
        case login
    }
    
    static var shared: SceneDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("errol")
        }
        return scene
    }
    
    var window: UIWindow?
    let tabbarController = BaseTabBarController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        setroot(with: .login)
        window?.makeKeyAndVisible()
    }
    
    func setTabbar() {
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home",image: UIImage(systemName: "house"), tag: 0)
        let mapVC = MessagesViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "icons8-instagram-30"), tag: 1)
        let favoriteVC = FriendsViewController()
        let favoriteNavi = UINavigationController(rootViewController: favoriteVC)
        favoriteNavi.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "icons8-gmail-logo-30"), tag: 2)
        favoriteNavi.tabBarItem.badgeValue = "99"
        favoriteNavi.tabBarItem.badgeColor = .blue
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        tabbarController.setViewControllers([homeNavi, mapNavi, favoriteNavi, profileNavi], animated: true)
        tabbarController.tabBar.tintColor = .orange
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    func setroot(with set: check) {
        switch set {
        case .tabbar:
            setTabbar()
            window?.rootViewController = tabbarController
        case .login:
            let vc = Bai2LoginViewController()
            let navi = UINavigationController(rootViewController: vc)
            window?.rootViewController = navi
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

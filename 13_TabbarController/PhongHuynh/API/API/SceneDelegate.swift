import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UITabBarControllerDelegate {
    
    enum TypeScreen {
        case login
        case tabbar
    }

    static var shared: SceneDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("errol")
        }
        return scene
    }
    var window: UIWindow?
    let tabbarController = BaseTabBarViewController()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        changeScreen(type: .login)
    }
    
    func createTabbar() {
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
    
    func createLogin() {
        let loginVC = NetWorkingViewController()
        let loginNavi = BaseNavigationViewController(rootViewController: loginVC)
        window?.rootViewController = loginNavi
    }
    
    func setroot(with set: TypeScreen) {
        switch set {
        case .tabbar:
            createTabbar()
            window?.rootViewController = tabbarController
        case .login:
            createLogin()
        }
    }
    
    func changeScreen(type: TypeScreen) {
        switch type {
        case .login:
            createLogin()
        case .tabbar:
            createTabbar()
        }
    }
}

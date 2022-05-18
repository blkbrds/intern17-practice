import UIKit
import SVProgressHUD

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    enum Check {
            case tabbar
            case login
    }

    static var shared: AppDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? AppDelegate else {
            fatalError("Errol")
        }
        return scene
    }

    var window: UIWindow?
    let tabbarController = UITabBarController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
//        setroot(with: .login)
//        window?.makeKeyAndVisible()
        return true
    }

    func setTabbar() {
        let homeVC = HomeViewController()
      //  let homeNavi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Trang chủ", image: #imageLiteral(resourceName: "icons8-home-24"), tag: 0)
        let shortVC = ShortsViewController()
        let shortNavi = UINavigationController(rootViewController: shortVC)
        shortNavi.tabBarItem = UITabBarItem(title: "Shorts", image: #imageLiteral(resourceName: "icons8-short-film-24"), tag: 1)
        let chanelVC = ChanelViewController()
        let chanelNavi = UINavigationController(rootViewController: chanelVC)
        chanelNavi.tabBarItem = UITabBarItem(title: "Kênh đăng ký", image: #imageLiteral(resourceName: "icons8-video-playlist-16"), tag: 2)
        let libraryVC = FavoriteViewController()
        let libraryNavi = UINavigationController(rootViewController: libraryVC)
        libraryNavi.tabBarItem = UITabBarItem(title: "Thư viện", image: #imageLiteral(resourceName: "icons8-video-playlist-24"), tag: 3)
        tabbarController.setViewControllers([homeVC, shortNavi, chanelNavi, libraryNavi], animated: true)
        tabbarController.tabBar.tintColor = .black
        UITabBar.appearance().barTintColor = UIColor.white
    }

    func setroot(with set: Check) {
        switch set {
        case .tabbar:
            setTabbar()
            window?.rootViewController = tabbarController
        case .login:
            let vc = HomeViewController()
            window?.rootViewController = vc
        }
    }
}
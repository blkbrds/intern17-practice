import UIKit
import SVProgressHUD
import GoogleSignIn
import AppAuth
import RealmSwift

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    enum Check {
            case tabbar
            case login
    }

    static var shared: AppDelegate {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Errol")
        }
        return appDelegate
    }

    var window: UIWindow?
    let tabbarController = UITabBarController()
    let signInConfig = GIDConfiguration.init(clientID: "1067897935402-urdpk47r6q9m58tbj9c5ed0mn7ck5un0.apps.googleusercontent.com")

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        var handled: Bool
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        return false
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Session.shared.apiKey = "AIzaSyBZUApeMD5NKoO1MTLgT6ns83f_r2gwBjs"
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
            } else {
            }
        }
        configRealm()
        window = UIWindow(frame: UIScreen.main.bounds)
        if Session.shared.isLogin {
            setroot(with: .tabbar)
        } else {
            setroot(with: .login)
        }
        window?.makeKeyAndVisible()
        return true
    }

    func configRealm() {
        let fileManager = FileManager.default
            var config = Realm.Configuration()
            let urls = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask)
            if let applicationSupportURL = urls.last {
                do {
                    try fileManager.createDirectory(at: applicationSupportURL, withIntermediateDirectories: true, attributes: nil)
                    config.fileURL = applicationSupportURL.appendingPathComponent("demo.realm")
                } catch let err {
                    print(err)
                }
            }
        config.deleteRealmIfMigrationNeeded = true
            // Set this as the configuration used for the default Realm
            Realm.Configuration.defaultConfiguration = config
        //    print (Realm.Configuration.defaultConfiguration.fileURL ?? "")
    }

    func setTabbar() {
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
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
        tabbarController.setViewControllers([homeNavi, shortNavi, chanelNavi, libraryNavi], animated: true)
        tabbarController.tabBar.tintColor = .white
        UITabBar.appearance().barTintColor = UIColor.black
    }

    func setroot(with set: Check) {
        switch set {
        case .tabbar:
            setTabbar()
            window?.rootViewController = tabbarController
        case .login:
            let vc = LoginViewController()
            window?.rootViewController = vc
        }
    }
}

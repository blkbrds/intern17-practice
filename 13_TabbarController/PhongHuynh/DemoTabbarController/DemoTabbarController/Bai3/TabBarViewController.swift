import UIKit

class TabBarViewController: UITabBarController {

    @IBOutlet weak var tabbar1: UITabBar!
    let tabbar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
    }
    
    func setTabBar() {
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let mapVC = MessagesViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 1)
        mapNavi.tabBarItem.badgeValue = "99"
        mapNavi.tabBarItem.badgeColor = .blue
        let favoriteVC = FriendsViewController()
        let favoriteNavi = UINavigationController(rootViewController: favoriteVC)
        favoriteNavi.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 2)
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        tabbar.setViewControllers([homeNavi, mapNavi, favoriteNavi, profileNavi], animated: true)
        tabbar.tabBar.tintColor = .orange
     //   UITabBar.appearance().barTintColor = UIColor.black
    }

}

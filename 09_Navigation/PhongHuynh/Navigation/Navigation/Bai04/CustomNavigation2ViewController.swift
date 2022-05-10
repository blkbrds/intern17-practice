import UIKit

final class CustomNavigation2ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News Feed"
        guard let navi = navigationController else { return }
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.leftBarButtonItem = searchItem
        let bookMarkItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        navigationItem.rightBarButtonItem = bookMarkItem
        navi.navigationBar.backgroundColor = .blue
    }
}

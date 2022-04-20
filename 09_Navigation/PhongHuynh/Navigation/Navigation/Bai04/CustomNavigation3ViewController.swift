import UIKit

final class CustomNavigation3ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        guard let navi = navigationController else { return }
        navi.navigationBar .setBackgroundImage(UIImage(named: "cricket.jpeg"), for: .default)
        navi.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
    }
}

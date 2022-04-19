import UIKit

final class CustomNavigation3ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        self.navigationController?.navigationBar .setBackgroundImage(UIImage(named: "cricket.jpeg"), for: .default)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
    }
}

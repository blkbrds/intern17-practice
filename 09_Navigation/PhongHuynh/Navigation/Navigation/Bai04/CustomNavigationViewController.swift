import UIKit

final class CustomNavigationViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK: - IBActions
    @IBAction func push(_ sender: Any) {
        let vc = CustomNavigation1ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

import UIKit

final class CustomNavigationViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction private func push(_ sender: Any) {
        guard let navi = navigationController else { return }
        let vc = CustomNavigation1ViewController()
        navi.pushViewController(vc, animated: true)
    }
}

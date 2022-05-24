import UIKit

final class NavigationViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Navigation"
    }
    
    // MARK: - IBActions
    @IBAction private func push(_ sender: Any) {
        guard let navi = navigationController else { return }
        let vc = SecondViewController()
        navi.pushViewController(vc, animated: true)
    }
}

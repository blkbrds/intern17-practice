import UIKit

final class FourViewController: UIViewController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Four"
    }

    // MARK: - IBActions
    @IBAction private func push(_ sender: Any) {
        guard let navi = navigationController else { return }
        let vc = FiveViewController()
        navi.pushViewController(vc, animated: true)
    }
    
    @IBAction private func popThird(_ sender: Any) {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }
    
    @IBAction private func popSecond(_ sender: Any) {
        guard let navi = navigationController else { return }
        let vc = navi.viewControllers[1]
        navi.popToViewController(vc, animated: true)
    }
    
    @IBAction private func root(_ sender: Any) {
        guard let navi = navigationController else { return }
        navi.popToRootViewController(animated: true)
    }
}

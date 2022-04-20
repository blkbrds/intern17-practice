import UIKit

final class FiveViewController: UIViewController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Five"
    }
    
    // MARK: - IBActions
    @IBAction private func popThird(_ sender: Any) {
        guard let navi = navigationController else { return }
        let vc = navi.viewControllers[2]
        navi.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popSecond(_ sender: Any) {
        guard let navi = navigationController else { return }
        let vc = navi.viewControllers[1]
        navi.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popFour(_ sender: Any) {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }
    
    @IBAction private func root(_ sender: Any) {
        guard let navi = navigationController else { return }
        navi.popToRootViewController(animated: true)
    }
}

import UIKit

final class ThirdViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Third"
    }

    // MARK: - IBActions
    @IBAction private func push(_ sender: Any) {
        guard let navi = navigationController else { return }
        let vc = FourViewController()
        navi.pushViewController(vc, animated: true)
    }
    
    @IBAction private func pop(_ sender: Any) {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }
    
    @IBAction private func root(_ sender: Any) {
        guard let navi = navigationController else { return }
        navi.popToRootViewController(animated: true)
    }
}

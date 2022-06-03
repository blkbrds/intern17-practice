
import UIKit

final class CViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC c"
    }

    // MARK: - IBActions
    @IBAction private func NextButtonTouchUpInside(_ sender: Any) {
        let vc = DViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func PreButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func RootButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

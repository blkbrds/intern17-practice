
import UIKit

final class SecondViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC B"
    }

    // MARK: - IBActions
    @IBAction private func NextButtonTouchUpInside(_ sender: Any) {
        let vc = CViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func PreButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


import UIKit

final class SecondViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC B"
    }

    // MARK: - IBACtion
    @IBAction private func NextButtonTouchUpInside(_ sender: Any) {
        let vc = CViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func PreButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


import UIKit

final class Bai1ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC A"
    }

    // MARK: - IBAction
    @IBAction private func pushTouchUpInside(_ sender: Any) {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

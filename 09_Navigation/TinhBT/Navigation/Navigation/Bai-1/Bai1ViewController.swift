
import UIKit

final class Bai1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "VC A"
    }

    @IBAction private func pushTouchUpInside(_ sender: Any) {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

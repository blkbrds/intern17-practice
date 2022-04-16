import UIKit

final class ThirdViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Third"
    }

    // MARK: - IBActions
    @IBAction func push(_ sender: Any) {
        let vc = FourViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func root(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToRootViewController(animated: true)
    }
}

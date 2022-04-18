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
    
    // MARK: - IBActions
    @IBAction func pop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func root(_ sender: Any) {
        _ = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToRootViewController(animated: true)
    }
}

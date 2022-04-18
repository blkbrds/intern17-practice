import UIKit

final class FourViewController: UIViewController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Four"
    }

    // MARK: - IBActions
    @IBAction func push(_ sender: Any) {
        let vc = FiveViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func popThird(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func popSecond(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func root(_ sender: Any) {
        _ = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

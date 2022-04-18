import UIKit

final class FiveViewController: UIViewController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Five"
    }
    
    // MARK: - IBActions
    @IBAction func popThird(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func popSecond(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func popFour(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // MARK: - IBActions
    @IBAction func root(_ sender: Any) {
        _ = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToRootViewController(animated: true)    }
}

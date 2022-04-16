import UIKit

final class FiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Five"
    }

    // MARK: - IBActions
    @IBAction func popThird(_ sender: Any) {
        
    }
    
    @IBAction func popSecond(_ sender: Any) {
        
    }
    @IBAction func popFour(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func root(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToRootViewController(animated: true)    }
}

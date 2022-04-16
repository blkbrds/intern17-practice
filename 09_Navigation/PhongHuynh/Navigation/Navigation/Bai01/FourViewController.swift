import UIKit

final class FourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Four"
    }

    // MARK: - IBActions
    @IBAction func push(_ sender: Any) {
        let vc = FiveViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func popThird(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)    }
    
    @IBAction func popSecond(_ sender: Any) {
        
    }
    
    @IBAction func root(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
}

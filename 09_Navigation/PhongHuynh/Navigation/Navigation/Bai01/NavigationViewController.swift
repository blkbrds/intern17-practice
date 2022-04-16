import UIKit

final class NavigationViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Navigation"
    }
    
    // MARK: - IBActions
    @IBAction func push(_ sender: Any) {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
}

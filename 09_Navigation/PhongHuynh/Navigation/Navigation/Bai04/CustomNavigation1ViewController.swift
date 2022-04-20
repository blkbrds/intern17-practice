import UIKit

final class CustomNavigation1ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        let leftButton1 = UIBarButtonItem(title: "Mid 1", style: .plain, target: self, action: nil)
        let leftButton2 = UIBarButtonItem(title: "Mid 2", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [leftButton1, leftButton2]
        self.navigationItem.leftItemsSupplementBackButton = true
        navigationItem.prompt = NSLocalizedString("1:12 PM", comment: "1")
    }
}

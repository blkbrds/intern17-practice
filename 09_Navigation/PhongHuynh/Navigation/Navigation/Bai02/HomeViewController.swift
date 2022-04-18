import UIKit

protocol HomeDelegate: AnyObject {
    func didTap(view: HomeViewController, needsPerfom actions: HomeViewController.Action)
}

final class HomeViewController: UIViewController {
    
    enum Action {
        case tap(username: String, password: String)
    }
    
    weak var delegate: HomeDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameLabel: UILabel!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        let leftButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func leftAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightAction() {
        let vc = EditViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

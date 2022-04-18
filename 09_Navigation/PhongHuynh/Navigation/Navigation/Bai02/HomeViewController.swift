import UIKit

protocol HomeViewControllerDelegate: class {
    func controller(view: HomeViewController, needsPerfom actions: HomeViewController.Action)
}
class HomeViewController: UIViewController {
    
    enum Action {
        case logout
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    
    var userName: String = ""
    weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let leftButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        nameLabel.text = userName
    }
    
    // MARK: - Objc functions
    @objc func leftAction() {
        if let delegate = delegate {
            delegate.controller(view: self, needsPerfom: .logout)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightAction() {
        let vc = EditViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - EditDelegate
extension HomeViewController: EditDelegate {
    func didTap(view: EditViewController, needsPerfom actions: EditViewController.Action) {
        switch actions {
        case .tap(let userName):
            nameLabel.text = userName
        }
    }
}

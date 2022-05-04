import UIKit

// MARK: - Bai2HomeViewControllerDelegate
protocol Bai2HomeViewControllerDelegate: class {
    func controller(view: Bai2HomeViewController, needsPerfom actions: Bai2HomeViewController.Action)
}

final class Bai2HomeViewController: UIViewController {

    // MARK: - Define
    enum Action {
        case logout
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Properties
    var userName: String = ""
    weak var delegate: Bai2HomeViewControllerDelegate?
    
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
    @objc private func leftAction() {
        if let delegate = delegate {
            delegate.controller(view: self, needsPerfom: .logout)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func rightAction() {
        let vc = Bai2EditViewController()
        vc.delegate = self
        SceneDelegate.shared.setroot(with: .tabbar)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - EditViewControllerDelegate
extension Bai2HomeViewController: Bai2EditViewControllerDelegate {
    func controller(view: Bai2EditViewController, needsPerfom actions: Bai2EditViewController.Action) {
        switch actions {
        case .tap(let userName):
            nameLabel.text = userName
        }
    }
}

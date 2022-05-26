import UIKit

// MARK: - Bai2HomeViewControllerDelegate
protocol Bai2HomeViewControllerDelegate: class {

    func controller(controller: Bai2HomeViewController, needsPerfom actions: Bai2HomeViewController.Action)
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
        configUI()
    }
    
    // MARK: - Private functions
    private func configUI() {
        title = "Home"
        let leftButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(leftButtonTouchUpInside))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightButtonTouchUpInside))
        navigationItem.rightBarButtonItem = rightButton
        nameLabel.text = userName
    }
    
    // MARK: - Objc functions
    @objc private func leftButtonTouchUpInside() {
        if let delegate = delegate {
            delegate.controller(controller: self, needsPerfom: .logout)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func rightButtonTouchUpInside() {
        let vc = Bai2EditViewController()
        vc.delegate = self
        SceneDelegate.shared.setroot(with: .tabbar)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Bai2EditViewControllerDelegate
extension Bai2HomeViewController: Bai2EditViewControllerDelegate {

    func controller(controller: Bai2EditViewController, needsPerfom actions: Bai2EditViewController.Action) {
        switch actions {
        case .tap(let userName):
            nameLabel.text = userName
        }
    }
}

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let leftButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    // MARK: - Objc functions
    @objc private func leftAction() {
        SceneDelegate.shared.setroot(with: .login)
    }
}

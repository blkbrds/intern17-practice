import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let leftButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(leftButtonTouchUpInside))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    // MARK: - Objc functions
    @objc private func leftButtonTouchUpInside() {
        SceneDelegate.shared.setroot(with: .login)
    }
}

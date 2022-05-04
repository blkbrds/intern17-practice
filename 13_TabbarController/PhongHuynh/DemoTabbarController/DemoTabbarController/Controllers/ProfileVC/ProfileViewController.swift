import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        let leftButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc private func leftAction() {
        SceneDelegate.shared.setroot(with: .login)
    }

}

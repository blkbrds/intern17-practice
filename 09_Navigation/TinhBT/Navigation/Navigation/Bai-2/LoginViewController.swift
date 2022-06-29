

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    var homeViewController = HomeViewController()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        createButton()
        homeViewController.delegate = self
    }
    
    // MARK: - Private functions
    private func createButton() {
        let donButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        donButton.addTarget(self, action: #selector(don), for: .touchUpInside)
        donButton.setTitle("Done", for: .normal)
        donButton.setTitleColor(.blue, for: .normal)
        let rightBarButton = UIBarButtonItem(customView: donButton)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // MARK: - Objc functions
    @objc private func don() {
        if userNameTextField.text == "tinh123" && passwordTextField.text == "123" {
            navigationController?.pushViewController(homeViewController, animated: true)
            homeViewController.username = userNameTextField.text ?? ""
        }
    }
}

// MARK: - HomeViewDelegate
extension LoginViewController: HomeViewDelegate {
    func view(view: HomeViewController, needPerform action: HomeViewController.Action ) {
        switch action {
        case .logout:
            userNameTextField.text = ""
            passwordTextField.text = ""
        }
    }
}

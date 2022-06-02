

import UIKit

final class LoginViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Property
    var hvc = HomeViewController()

    // MARK: - Lyfe cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        createButton()
        hvc.delegate = self
    }
    
    // MARK: - Private function
    private func createButton() {
        let donButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        donButton.addTarget(self, action: #selector(don), for: .touchUpInside)
        donButton.setTitle("Done", for: .normal)
        donButton.setTitleColor(.blue, for: .normal)
        let rightBarButton = UIBarButtonItem(customView: donButton)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc private func don() {
        if userNameTextField.text == "tinh123" && passwordTextField.text == "123" {
            navigationController?.pushViewController(hvc, animated: true)
            hvc.username = userNameTextField.text ?? ""
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

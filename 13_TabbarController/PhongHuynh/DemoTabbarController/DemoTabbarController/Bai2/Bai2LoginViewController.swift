import UIKit

class Bai2LoginViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
       
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - Objc functions
    @objc private func rightAction() {
        guard let userName = usernameTextField.text, let password = passwordTextField.text, !userName.isEmpty, !password.isEmpty else {
            showLabel.text = "Chua nhap gia tri"
            return
        }
//        if DataManager.checkData(userName: userName, password: password) {
//            let vc = Bai2HomeViewController()
//            vc.userName = userName
//            vc.delegate = self
//            self.navigationController?.pushViewController(vc, animated: true)
//        } else {
//            showLabel.text = "Sai username hoac password"
//        }
    }
}

extension Bai2LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
        if textField.returnKeyType == .done {
            rightAction()
        }
        return true
    }
}

// MARK: - HomeViewControllerDelegate
extension Bai2LoginViewController: Bai2HomeViewControllerDelegate {
    func controller(view: Bai2HomeViewController, needsPerfom actions: Bai2HomeViewController.Action) {
        switch actions {
        case .logout:
            usernameTextField.text = ""
            passwordTextField.text = ""
        }
    }
}

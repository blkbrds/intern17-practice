import UIKit

final class Bai3ViewController: UIViewController {
    
    let username: String = "Admin"
    let password: String = "Admin123"

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    func login() -> Bool {
        if usernameTextField.text == username && passwordTextField.text == password {
            return true
        }
        return false
    }
    
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        errorLabel.isHidden = login()
    }
   
    @IBAction private func clearButtonTouchUpInside(_ sender: Any) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension Bai3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
        if textField.returnKeyType == .done {
            errorLabel.isHidden = login()
        }
        return true
    }
}

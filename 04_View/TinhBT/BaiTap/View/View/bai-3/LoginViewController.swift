
import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passWordTextField.delegate = self
        passWordTextField.returnKeyType = .done
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userNameTextField.resignFirstResponder()
        passWordTextField.resignFirstResponder()
    }
    
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        if userNameTextField.text == "Admin" && passWordTextField.text == "Admin123" {
            errorLabel.text = "Đăng nhập thành công"
        } else {
            errorLabel.text = "Đăng nhập sai"
        }
        errorLabel.isHidden = false
    }
    
    @IBAction private func buttonClear(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passWordTextField.becomeFirstResponder()
        if textField.returnKeyType == .done {
            loginButtonTouchUpInside((Any).self)
        }
        return true
    }
}

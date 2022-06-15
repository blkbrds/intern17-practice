import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        errorLabel.text = "Nhập sai username và password"
        errorLabel.isHidden = true
        loginButton.layer.cornerRadius = 5
        clearButton.layer.cornerRadius = 5
        userNameTextField.delegate = self
        userNameTextField.returnKeyType = .next
        passWordTextField.delegate = self
        passWordTextField.returnKeyType = .done
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction private func loginButtonTouchUpInside(_ sender: Any?) {
        view.endEditing(true)
        if userNameTextField.text != "Admin" || passWordTextField.text != "Admin123" {
            errorLabel.isHidden = false
        } else {
            errorLabel.isHidden = true
        }
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case userNameTextField:
            passWordTextField.becomeFirstResponder()
        case passWordTextField:
            loginButtonTouchUpInside(nil)
        default:
            passWordTextField.resignFirstResponder()
        }
    }
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
}

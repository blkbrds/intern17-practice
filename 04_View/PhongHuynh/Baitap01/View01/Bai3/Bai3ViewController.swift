import UIKit

final class Bai3ViewController: UIViewController {
    
    // MARK: - Properties
    let username: String = "Admin"
    let password: String = "Admin123"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: - Life cycle
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
    
    // MARK: - Private functions
    func login() {
        guard let username = usernameTextField.text, let password = passwordTextField.text, !username.isEmpty, !password.isEmpty else {
            errorLabel.text = "chưa nhập user hoặc password"
            return
        }
        if username == "Admin" && password == "Admin123" {
            errorLabel.isHidden = true
        } else {
            errorLabel.text = "nhập sai username hoặc password"
            errorLabel.isHidden = false
        }
    }
    
    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        login()
    }
    
    // MARK: - IBActions
    @IBAction private func clearButtonTouchUpInside(_ sender: Any) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - UITextFieldDelegate
extension Bai3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
        if textField.returnKeyType == .done {
            login()
        }
        return true
    }
}

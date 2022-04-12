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
    func login() -> Bool {
        if usernameTextField.text == username && passwordTextField.text == password {
            return true
        }
        return false
    }
    
    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        errorLabel.isHidden = login()
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
            errorLabel.isHidden = login()
        }
        return true
    }
}

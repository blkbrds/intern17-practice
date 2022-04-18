import UIKit


class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet weak var showLabel: UILabel!
    
   
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        let rightButton = UIBarButtonItem(title: "Don", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           usernameTextField.resignFirstResponder()
           passwordTextField.resignFirstResponder()
    }
    
    @objc func rightAction() {
        errolLabel()
    }
    
   
    func clearTextField() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func errolLabel() {
        let vc = HomeViewController()
        if usernameTextField.text == "" && passwordTextField.text == "password" {
            showLabel.text = "chua nhap username"
        } else if usernameTextField.text == "username" && passwordTextField.text == "" {
            showLabel.text = "chua nhap password"
        } else if usernameTextField.text == "username" && passwordTextField.text == "password" {
            self.navigationController?.pushViewController(vc, animated: true)
        } else if usernameTextField.text == "" && passwordTextField.text == "" {
            showLabel.text = "chua nhap dung du lieu"
        }
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            passwordTextField.becomeFirstResponder()
            if textField.returnKeyType == .done {
            }
            return true
        }
}

    


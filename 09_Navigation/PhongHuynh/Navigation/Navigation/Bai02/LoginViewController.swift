import UIKit

enum Check: String {
    case noUserName = "Chưa nhập tên đăng nhập"
    case noPassword = "Chưa nhập mật khẩu"
    case empty = "Chưa nhập dữ liệu"
    case incorrect = "Nhập sai tên đặng nhập hoặc mật khẩu"
}

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet weak var showLabel: UILabel!
    
    var check: Check = .empty {
        didSet {
            showResult()
        }
    }
    
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
        guard let userName = usernameTextField.text, let password = passwordTextField.text else { return }
        let user = User(userName: userName, password: password)
        check = user.checkUserPassword()
        login()
    }
    
    func login() -> Bool {
        let vc = HomeViewController()
        if usernameTextField.text == "username" && passwordTextField.text == "password"  {
            return ((self.navigationController?.pushViewController(vc, animated: true)) != nil)
        }
        return false
    }
    
    func showResult() {
        showLabel.text = check.rawValue
    }

}

struct User {
    var userName: String
    var password: String
    
    func checkUserPassword() -> Check {
        switch (userName, password) {
        case ("", ""): return .empty
        case (_, ""): return .noPassword
        case ("", _): return .noUserName
        default: return .incorrect
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

    


import UIKit

enum Check: String {
    case noUserName = "Chưa nhập tên đăng nhập"
    case noPassword = "Chưa nhập mật khẩu"
    case empty = "Chưa nhập dữ liệu"
    case correct = "Nhập đúng"
    case incorrect = "Nhập sai tên đặng nhập hoặc mật khẩu"
}

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    var check: Check?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"
        let rightButton = UIBarButtonItem(title: "Don", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        
    }
    
    @objc func rightAction() {
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        guard let userName = usernameTextField.text, let password = passwordTextField.text else { return }
        let user = User(userName: userName, password: password)
        if check == user.checkUserPassword() {
        }
    }

}

struct User {
    var userName: String
    var password: String
    
    func checkUserPassword() -> Check {
        switch (userName, password) {
        case ("abc", "123"): return .correct
        case ("", ""): return .empty
        case (_, ""): return .noPassword
        case ("", _): return .noUserName
        default: return .incorrect
        }
    }
}

    


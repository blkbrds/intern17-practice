import UIKit

final class Bai2LoginViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var showLabel: UILabel!
    
    // MARK: - Life cycle
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
        if DataManager.checkData(userName: userName, password: password) {
            let vc = Bai2HomeViewController()
            vc.userName = userName
            vc.delegate = self
            //          navigationController?.pushViewController(vc, animated: true)
            let navi = BaseNavigationController(rootViewController: vc)
            navi.modalPresentationStyle = .fullScreen
            present(navi, animated: true, completion: nil)
        } else {
            showLabel.text = "Sai username hoac password"
        }
    }
}

// MARK: - UITextFieldDelegate
extension Bai2LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
        if textField.returnKeyType == .done {
            SceneDelegate.shared.setroot(with: .tabbar)
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

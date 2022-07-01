//
//  LoginViewController.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/29/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: - MARK: - Properties
    var nsDictionary: NSDictionary?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private methods
    private func configView() {
        title = "Login"
        usernameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        let loginButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(checkLogin))
        navigationItem.rightBarButtonItem = loginButton
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    // MARK: - Objcs
    @objc private func checkLogin() {
        guard let username = usernameTextField.text, let password = passwordTextField.text, !username.isEmpty, !password.isEmpty else {
            errorLabel.alpha = 1.0
            errorLabel.text = "Chưa nhập user hoặc password"
            return
        }
        if DataManager.checkData(username: username, password: password) {
            let vc = HomeViewController()
            vc.username = username
            self.navigationController?.pushViewController(vc, animated: true)
            errorLabel.alpha = 0.0
        } else {
            errorLabel.text = "Nhập sai username và password"
            errorLabel.alpha = 1.0
        }
    }
    
}

// MARK: - Extensions
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            checkLogin()
        }
        return true
    }
}

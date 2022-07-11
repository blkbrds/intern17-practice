//
//  LoginViewController.swift
//  TabbarController
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/11/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
    }
    
    // MARK: - Functions
    private func configViewController() {
        title = "Login"
        usernameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - Objc function
    @objc private func checkLogin() {
        guard let username = usernameTextField.text, let password = passwordTextField.text, !username.isEmpty, !password.isEmpty else {
            errorLabel.text = "Chưa nhập user hoặc password"
            errorLabel.alpha = 1.0
            return
        }
        if username == "admin" && password == "123" {
            let scene = UIApplication.shared.connectedScenes.first
            if let sceneDelegate : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                sceneDelegate.changeScreen(type: .tabbar)
            }
            errorLabel.alpha = 0.0
        } else {
            errorLabel.text = "Nhập sai username và password"
            errorLabel.alpha = 1.0
        }
    }
    
    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        checkLogin()
    }
    
    @IBAction private func forgotPasswordButtonTouchUpInside(_ sender: Any) {
        let vc = ForgotPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func signUpButtonTouchUpInside(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension
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

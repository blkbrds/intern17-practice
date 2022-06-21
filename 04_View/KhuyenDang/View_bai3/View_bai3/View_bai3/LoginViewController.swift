//
//  LoginViewController.swift
//  View_bai3
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/15/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        clearButton.layer.cornerRadius = 10
        usernameTextField.returnKeyType = .next
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func login() {
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        if username == "" || password == "" {
            errorLabel.isHidden = false
            errorLabel.text = "Bạn nhập thiếu thông tin"
        } else if username == "Admin" && password == "Admin123" {
            errorLabel.isHidden = true
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Username hoặc password không hợp lệ"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    // MARK - IBAction
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        login()
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            login()
        }
        return true
    }
}

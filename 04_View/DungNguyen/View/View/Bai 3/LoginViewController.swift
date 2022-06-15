//
//  LoginViewController.swift
//  View
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/13/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius =  10
        clearButton.layer.cornerRadius = 10
    }
    
    @IBAction func loginButton(_ sender: Any) {
        login()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func login() {
        let username = usernameTextField.text
        let password = passwordTextField.text

        if username == "" || password == "" {
            errorLabel.text = "Chưa nhập username và password"
        } else if username == "Admin" && password == "Admin123" {
            errorLabel.isHidden = true
        } else {
            errorLabel.text = "Nhập sai username và password"
            errorLabel.isHidden = false
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            login()
        }
        return true
    }
}

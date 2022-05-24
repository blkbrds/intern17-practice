//
//  BT3XViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/28/22.
//

import UIKit

final class BT3XViewController: UIViewController {
    
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let errorLabel = UILabel()
    let loginButton = UIButton()
    let clearButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addActionToButtons()
        addGesture()
    }
    
    private func addGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap() {
        view.endEditing(true)
    }
    
    private func setupView(){
        let widthView = view.frame.width
        let frameUsername = CGRect(x: 20, y: 100, width: widthView - 40, height: 40)
        userNameTextField.frame = frameUsername
        userNameTextField.placeholder = "username"
        userNameTextField.layer.cornerRadius = 4
        userNameTextField.backgroundColor = .white
        userNameTextField.layer.borderWidth = 1
        view.addSubview(userNameTextField)
        
        let framePassword = CGRect(x: 20, y: 170, width: widthView - 40, height: 40)
        passwordTextField.frame = framePassword
        passwordTextField.placeholder = " password"
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.borderWidth = 1
        view.addSubview(passwordTextField)
        
        let frameError = CGRect(x: 20, y: 220, width: widthView - 40, height: 40)
        errorLabel.frame = frameError
        errorLabel.backgroundColor = .white
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.text = "hahaahahahaha"
        errorLabel.isHidden = true
        view.addSubview(errorLabel)
        
        let frameLogin = CGRect(x: 20, y: 270, width: widthView / 2 - 40, height: 40)
        loginButton.frame = frameLogin
        loginButton.layer.cornerRadius = 4
        loginButton.backgroundColor = .blue
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        view.addSubview(loginButton)
        
        let frameClear = CGRect(x: widthView / 2 + 20, y: 270, width: widthView / 2 - 40, height: 40)
        clearButton.frame = frameClear
        clearButton.layer.cornerRadius = 4
        clearButton.backgroundColor = .blue
        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(.white, for: .normal)
        view.addSubview(clearButton)
    }
    
    private func addActionToButtons() {
        loginButton.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
    }
    
    @objc func didTap(sender: UIButton) {
        switch sender {
        case loginButton:
            let result = validateLogin()
            print(result)
            switch result {
            case .success(string: let value):
                errorLabel.text = value
                errorLabel.isHidden = true
            case .usernameIsNotCorrect(string: let value):
                errorLabel.text = value
                errorLabel.isHidden = false
            case .passwordIsNotCorrect(string: let value):
                errorLabel.text = value
                errorLabel.isHidden = false
            case .noTextInUserName(string: let value):
                errorLabel.text = value
                errorLabel.isHidden = false
            case .noTextInPassword(string: let value):
                errorLabel.text = value
                errorLabel.isHidden = false
            }
        case clearButton:
            userNameTextField.text = nil
            passwordTextField.text = nil
        default:
            break
        }
    }
    
    private func validateLogin() -> Result {
        guard let username = userNameTextField.text else {
            return .noTextInUserName(string: "Please fill username")
        }
        guard let password = passwordTextField.text else {
            return .noTextInPassword(string: "Please fill password")
        }
        if username == "Admin" {
            if password == "Admin123" {
                return .success(string: "Success")
            } else {
                return .passwordIsNotCorrect(string: "Please check password")
            }
        } else {
            return .usernameIsNotCorrect(string: "Please check username")
        }
    }
}

enum Result {
    case success(string: String)
    case usernameIsNotCorrect(string: String)
    case passwordIsNotCorrect(string: String)
    case noTextInUserName(string: String)
    case noTextInPassword(string: String)
}

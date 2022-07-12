//
//  LoginViewController.swift
//  TabBar
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/11/22.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Override func
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - Config
    private func configUI() {
        title = "Login"
        signInButton.layer.cornerRadius = 10
        usernameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - Private methods
    private func getUserFromPlist(withName name: String) -> [[String: Any]]?
    {
        var config: [[String: Any]]?
        if let infoPlistPath = Bundle.main.url(forResource: name, withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [[String: Any]] {
                    config = dict
                }
            } catch {
                print(error)
            }
        }
        return config
    }
    
    // MARK: - IBAction
    @IBAction private func forgotPassTouchUpInside(_ sender: Any) {
        let forgotPasswordVC = ForgotPasswordViewController()
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    @IBAction private func signUpButtonTouchUpInside(_ sender: Any) {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @IBAction private func signInButtonTouchUpInside(_ sender: Any) {
        handleLogin()
    }
    
    //MARK: - Private method
    private func handleLogin() {
        guard let listUser =  getUserFromPlist(withName: "UserData") else {
            return }
        for value in listUser {
            if let username = value["username"] as? String, let password = value["password"] as? String, usernameTextField.text == username && passwordTextField.text == password {
                changeRoot(type: .tabbar)
                return
            }
        }
        print("LOGIN FAIL")
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            handleLogin()
        }
        return true
    }
}

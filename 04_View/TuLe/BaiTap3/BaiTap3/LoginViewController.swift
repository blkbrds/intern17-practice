//
//  LoginViewController.swift
//  BaiTap3
//
//  Created by tu.le2 on 12/06/2022.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = "Nhập sai username và password"
        errorLabel.isHidden = true
        loginButton.layer.cornerRadius = 5
        clearButton.layer.cornerRadius = 5
        userNameTextField.delegate = self
        userNameTextField.returnKeyType = .next
        passWordTextField.delegate = self
        passWordTextField.returnKeyType = .done
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction private func Login(_ sender: Any?) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        if userNameTextField.text != "Admin" || passWordTextField.text != "Admin123" {
            errorLabel.isHidden = false
        } else {
            errorLabel.isHidden = true
        }
    }
    
    @IBAction private func Clear(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.userNameTextField:
            self.passWordTextField.becomeFirstResponder()
        case self.passWordTextField:
            self.Login(nil)
        default:
            self.passWordTextField.resignFirstResponder()
        }
    }
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
}

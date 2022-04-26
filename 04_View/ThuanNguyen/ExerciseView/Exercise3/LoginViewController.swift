//
//  LoginViewController.swift
//  ViewLogin
//
//  Created by thuan.nguyen on 19/04/2022.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    
    var usernameSuccess: String = "Admin"
    var passwordSuccess: String = "Admin123"
    
    // MARK: IBOutlets
    
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var labelUser: UILabel!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        
    }
    private func setUpUI() {
        title = "Login"
        btnLogin.layer.cornerRadius = 15
        btnClear.layer.cornerRadius = 15
        btnLogin.layer.masksToBounds = true
        btnClear.layer.masksToBounds = true
        txtUsername.delegate = self
        txtPassword.delegate = self
        txtPassword.text
    }

    @IBAction func loginActionTouchUpInside(_ sender: UIButton) {
        doneLogin()
    }

    private func doneLogin() {
        if txtUsername.text == usernameSuccess && txtPassword.text == passwordSuccess {
            labelUser.text = ""
        }else {
            labelUser.text = "Nhap sai Username va password"
        }
    }

    @IBAction func clearActionTouchUpInside(_ sender: UIButton) {
        txtUsername.text = ""
        txtPassword.text = ""
        labelUser.text = ""
    }

    func goToPasswordTextField() {
        txtPassword.becomeFirstResponder()
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtUsername {
            goToPasswordTextField()
        } else {
            doneLogin()
            txtUsername.becomeFirstResponder()
        }
        return true
    }
    
}

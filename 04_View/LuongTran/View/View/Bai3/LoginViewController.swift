//
//  LoginViewController.swift
//  View
//
//  Created by luong.tran on 19/08/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtAlert: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    
    
    var username = "Admin"
    var password = "Admin123"
    let deadlineTime = DispatchTime.now() + .seconds(5)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    func configUI(){
        txtUsername.layer.borderColor = UIColor.black.cgColor
        txtUsername.layer.borderWidth = 1
        txtUsername.layer.cornerRadius = 5
        
        
        txtPassword.layer.borderColor = UIColor.black.cgColor
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.cornerRadius = 5
        txtPassword.isSecureTextEntry = true
        
        txtAlert.textColor = .red
        txtAlert.isHidden = true
        
        btnLogin.layer.cornerRadius = 5
        btnClear.layer.cornerRadius = 5
    }
    
    func login(){
        if txtUsername.text != username || txtPassword.text != password || txtPassword.text!.isEmpty || txtPassword.text!.isEmpty{
            txtAlert.isHidden = false
            txtAlert.text = "Nhập sai Username và Password"
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.txtAlert.isHidden = true
            }
        }
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        login()
    }
    
    @IBAction func actionClear(_ sender: Any) {
        txtUsername.text = ""
        txtPassword.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtUsername.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
}


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtPassword.becomeFirstResponder()
        if textField.returnKeyType == .done {
            login()
        }
        return true
    }
}


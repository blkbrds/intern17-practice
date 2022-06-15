//
//  LoginViewController.swift
//  BaiTap3
//
//  Created by tu.le2 on 12/06/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassWord: UITextField!
    @IBOutlet weak var txtError: UILabel!
    @IBOutlet weak var outletLogin: UIButton!
    @IBOutlet weak var outletClear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtError.text = "Nhập sai username và password"
        txtError.isHidden = true
        outletLogin.layer.cornerRadius = 5
        outletClear.layer.cornerRadius = 5
        txtUserName.delegate = self
        txtUserName.returnKeyType = .next
        txtPassWord.delegate = self
        txtPassWord.returnKeyType = .done
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func Login(_ sender: Any?) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        if txtUserName.text == "" || txtPassWord.text == "" || txtUserName.text != "Admin" || txtPassWord.text != "Admin123" {
            txtError.isHidden = false
        } else {
            txtError.isHidden = true
        }
    }
    
    @IBAction func Clear(_ sender: Any) {
        txtUserName.text = ""
        txtPassWord.text = ""
    }
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.txtUserName:
            self.txtPassWord.becomeFirstResponder()
        case self.txtPassWord:
            self.Login(nil)
        default:
            self.txtUserName.resignFirstResponder()
        }
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
}

//
//  BT3XViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/28/22.
//

import UIKit

class BT3XViewController: UIViewController {
    let tfUsername = UITextField()
    let tfPassword = UITextField()
    let lbError = UILabel()
    let btnLogin = UIButton()
    let btnClear = UIButton()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addActionToButtons()
        addGesture()

        // Do any additional setup after loading the view.
    }
    
    func addGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        print("tap")
        view.endEditing(true)
    }
    
    func setupView(){
        let widthView = view.frame.width
        let heightView = view.frame.height
        let frameUsername = CGRect(x: 20, y: 100, width: widthView - 40, height: 40)
        tfUsername.frame = frameUsername
        tfUsername.placeholder = " username"
        tfUsername.layer.cornerRadius = 4
        tfUsername.backgroundColor = .white
        tfUsername.layer.borderWidth = 1
        view.addSubview(tfUsername)
        
        let framePassword = CGRect(x: 20, y: 170, width: widthView - 40, height: 40)
        tfPassword.frame = framePassword
        tfPassword.placeholder = " password"
        tfPassword.layer.cornerRadius = 4
        tfPassword.backgroundColor = .white
        tfPassword.layer.borderWidth = 1
        view.addSubview(tfPassword)
        
        let frameError = CGRect(x: 20, y: 220, width: widthView - 40, height: 40)
        lbError.frame = frameError
        lbError.backgroundColor = .white
        lbError.textColor = .red
        lbError.textAlignment = .center
        lbError.text = "hahaahahahaha"
        lbError.isHidden = true
        view.addSubview(lbError)
        
        let frameLogin = CGRect(x: 20, y: 270, width: widthView / 2 - 40, height: 40)
        btnLogin.frame = frameLogin
        btnLogin.layer.cornerRadius = 4
        btnLogin.backgroundColor = .blue
        btnLogin.setTitle("Login", for: .normal)
        btnLogin.setTitleColor(.white, for: .normal)
        view.addSubview(btnLogin)
        
        let frameClear = CGRect(x: widthView / 2 + 20, y: 270, width: widthView / 2 - 40, height: 40)
        btnClear.frame = frameClear
        btnClear.layer.cornerRadius = 4
        btnClear.backgroundColor = .blue
        btnClear.setTitle("Clear", for: .normal)
        btnClear.setTitleColor(.white, for: .normal)
        view.addSubview(btnClear)
    }
    
    func addActionToButtons() {
        btnLogin.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
        btnClear.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
    }
    
    @objc func didTap(sender: UIButton) {
        print(tfUsername.text)
        switch sender {
        case btnLogin:
            print("login")
            let result = validateLogin()
            print(result)
            switch result {
            case .success(string: let value):
                lbError.text = value
                lbError.isHidden = true
            case .usernameIsNotCorrect(string: let value):
                lbError.text = value
                lbError.isHidden = false
            case .passwordIsNotCorrect(string: let value):
                lbError.text = value
                lbError.isHidden = false
            case .noTextInUserName(string: let value):
                lbError.text = value
                lbError.isHidden = false
            case .noTextInPassword(string: let value):
                lbError.text = value
                lbError.isHidden = false
            }
        case btnClear:
            print("clear")
            tfUsername.text = nil
            tfPassword.text = nil
        default:
            break
        }
    }
    
    func validateLogin() -> Result {
        guard let username = tfUsername.text else {
            return .noTextInUserName(string: "Please fill username")
        }
        guard let password = tfPassword.text else {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based app
     lication, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

enum Result {
    case success(string: String)
    case usernameIsNotCorrect(string: String)
    case passwordIsNotCorrect(string: String)
    case noTextInUserName(string: String)
    case noTextInPassword(string: String)
}

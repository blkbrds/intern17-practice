//
//  Exercise03ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 31/03/2022.
//

import UIKit

final class Exercise03ViewController: UIViewController {

    // MARK: - Properties
    private let usernameSuccess: String = "Admin"
    private let passwordSuccess: String = "Admin123"
    
    // MARK: - Define Error
    enum LoginError: String {
        case notEnterData = "You not enter data"
        case notEnterUserName = "You not enter username"
        case notEnterPassWord = "You not enter password"
        case errorEnterData = " You enter bad name or password"
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var notiLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Exercise03"
        loginButton.layer.cornerRadius = 12
        clearButton.layer.cornerRadius = 12
        
        loginButton.layer.masksToBounds = true
        loginButton.layer.masksToBounds = true
        
        userNameTextField.delegate = self
        
        userNameTextField.keyboardType = .numberPad
        passWordTextField.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonTouchUpInside(_ sender: Any?) {
        let username = userNameTextField.text
        let password = passWordTextField.text
        let resultLogin: (String?, String?) = (username, password)
        switch resultLogin {
        case ("", ""):
            notiLabel.text = LoginError.notEnterData.rawValue
        case ("", _):
            notiLabel.text = LoginError.notEnterUserName.rawValue
        case(_, ""):
            notiLabel.text = LoginError.notEnterPassWord.rawValue
        case(usernameSuccess, passwordSuccess):
            notiLabel.text = "Login success"
        default:
            notiLabel.text = LoginError.errorEnterData.rawValue
        }
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension Exercise03ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passWordTextField.becomeFirstResponder()
        } else {
            loginButtonTouchUpInside(_: nil)
        }
        return true
    }
}

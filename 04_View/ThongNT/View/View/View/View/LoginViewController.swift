//
//  LoginViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

enum CheckInput: String {
    case noUsername = "Chưa nhập tên đăng nhập"
    case noPassword = "Chưa nhập mật khẩu"
    case empty = "Chưa nhập dữ liệu"
    case correct = "Nhập đúng"
    case incorrect = "Nhập sai tên đặng nhập hoặc mật khẩu"
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IBOulets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var informLabel: UILabel!
    
    //MARK: - Variables
    var checkInput : CheckInput = .empty {
        didSet {
            showResult()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - functions
    private func setupUI() {
        loginBtn.layer.cornerRadius = 10
        clearBtn.layer.cornerRadius = 10
    }
    
    private func showResult() {
        informLabel.text = checkInput.rawValue
    }
    
    private func loginProcess() {
        guard let userName = userNameTextField.text,
              let password = passWordTextField.text else {
            return
        }
        let user = User(userName: userName, password: password)
        checkInput = user.checkUserPassword()
    }
    
    
    // MARK: - IBAction functions
    @IBAction func loginButtonTouchUpInSide(_ sender: UIButton) {
        loginProcess()
    }

    @IBAction func clearButtonTouchUpInSide(_ sender: UIButton) {
        userNameTextField.text = ""
        passWordTextField.text = ""
        informLabel.text = ""
        userNameTextField.becomeFirstResponder()
    }
    
    @IBAction func clickOnNextKey(_ sender: AnyObject) {
        passWordTextField.becomeFirstResponder()
    }
    
    @IBAction func clickOnDoneKey(_ sender: AnyObject) {
        loginProcess()
        view.endEditing(true)
    }
    
    //MARK: - Override function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

struct User {
    var userName: String
    var password: String
    
    func checkUserPassword() -> CheckInput {
        switch (userName, password) {
        case ("abc","123"): return .correct
        case ("",""): return .empty
        case (_,""): return .noPassword
        case ("",_): return .noUsername
        default: return .incorrect
        }
    }
}

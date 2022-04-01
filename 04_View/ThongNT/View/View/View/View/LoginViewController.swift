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

final class LoginViewController: UIViewController {
    // MARK: - IBOulets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var loginBtn: UIButton!
    @IBOutlet private weak var clearBtn: UIButton!
    @IBOutlet private weak var informLabel: UILabel!
    
    //MARK: - Variables
    private var checkInput: CheckInput = .empty {
        didSet {
            showResult()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private functions
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
    
    
    // MARK: - IBAction private functions
    @IBAction private func loginButtonTouchUpInSide(_ sender: UIButton) {
        loginProcess()
    }
    
    @IBAction private func clearButtonTouchUpInSide(_ sender: UIButton) {
        userNameTextField.text = ""
        passWordTextField.text = ""
        informLabel.text = ""
        userNameTextField.becomeFirstResponder()
    }
    
    @IBAction private func clickOnNextKey(_ sender: AnyObject) {
        passWordTextField.becomeFirstResponder()
    }
    
    @IBAction private func clickOnDoneKey(_ sender: AnyObject) {
        loginProcess()
        view.endEditing(true)
    }
    
    //MARK: - Override function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

struct User {
    var userName: String
    var password: String
    
    func checkUserPassword() -> CheckInput {
        switch (userName, password) {
        case ("abc", "123"): return .correct
        case ("", ""): return .empty
        case (_, ""): return .noPassword
        case ("", _): return .noUsername
        default: return .incorrect
        }
    }
}

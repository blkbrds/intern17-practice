//
//  Exercise03ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 31/03/2022.
//

import UIKit

// MARK: - Enum
enum ErrorTextField {
    case NotLetter
    case WrongInput
    case MissedUserNameOrPassWord
}

final class Exercise03ViewController: UIViewController {

    // MARK: - Properties
    var username: String = "admin"
    var password: String = "admin123"
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var notiLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI
        setupUI()
    }
    
    // MARK: - Private Functions
    
    private func setupUI() {
        title = "Exercise03"
        loginButton.layer.cornerRadius = 12
        clearButton.layer.cornerRadius = 12
        
        hideKeyBoard()
    }
    
    private func throwErrorTextField(with errorTextFiled: ErrorTextField) {
        switch errorTextFiled {
        case .NotLetter:
            notiLabel.text = "Please enter the word"
        case .WrongInput:
            notiLabel.text = "Please enter the correct username and password"
        case .MissedUserNameOrPassWord:
            notiLabel.text = "Please enter in full username and password"
        }
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        if username == userNameTextField.text && password == passWordTextField.text {
            notiLabel.isHidden = true
        } else {
            throwErrorTextField(with: .NotLetter)
        }
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
}

// MARK: - Hide KeyBoard
extension Exercise03ViewController {
    
    private func hideKeyBoardWhenTap() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyBoard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyBoard() {
        view.endEditing(true)
    }
}

//
//  Exercise03ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 31/03/2022.
//

import UIKit

// MARK: - Enum Error
enum ErrorTextField {
    case NotLetter
    case WrongInput
    case MissedUserNameOrPassWord
}

final class Exercise03ViewController: UIViewController {

    // MARK: - Properties
    private var username: String = "admin"
    private var password: String = "admin123"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var notiLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
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
        
        loginButton.layer.masksToBounds = true
        loginButton.layer.masksToBounds = true
//        hideKeyboard()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
//
//// MARK: - Hide KeyBoard
//extension Exercise03ViewController {
//
//    func hideKeyboardWhenTapAround() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        view.addGestureRecognizer(tapGesture)
//    }
//
//    @objc func hideKeyboard() {
//        view.endEditing(true)
//    }
//}

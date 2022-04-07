//
//  Exercise03ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 31/03/2022.
//

import UIKit

final class Exercise03ViewController: UIViewController {

    // MARK: - Properties
    var username: String = "Admin"
    var password: String = "Admin123"
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var loginButon: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI
        setupUI()
        
    }
    
    // MARK: - Functions
    private func setupUI() {
        // title of view
        title = "Exercise03"
        
        loginButon.layer.cornerRadius = 16
        clearButton.layer.cornerRadius = 16
        
        loginButon.layer.masksToBounds = true
        clearButton.layer.masksToBounds = true
        
        // Ẩn bàn phím
        self.addTapToHideKeyBoard()
        
        // Bat Loi
        throwError(with: .isEmpty)
    }
    
    // Bắt các trường hợp lỗi
    func throwError(with error: ErrorMessage) {
        switch error {
        case .isEmpty:
            self.notificationLabel.text = "Please enter the word"
            self.notificationLabel.text = "Please enter the password"
        case .noInput:
            self.notificationLabel.text = "Please re-enter"
            self.notificationLabel.text = "Please re-enter"
        case .missUsername:
            self.notificationLabel.text = "Please enter the username"
        case .missPassWord:
            self.notificationLabel.text = "Please enter the password"
        }
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        // TextField đúng thì ẩn Label
        if username == usernameTextField.text, password == passwordTextField.text {
            self.notificationLabel.isHidden = true
        } else {
            // Nhập sai thì label báo
            self.notificationLabel.text = "Nhập sai username hoặc password"
        }
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: Any) {
        // xoa textfield
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: Private Functions
extension Exercise03ViewController {
    // Hide keyboard
    private func addTapToHideKeyBoard() {
        let tap = UIGestureRecognizer(target: self, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - Enums
extension Exercise03ViewController {
    enum ErrorMessage {
        case isEmpty
        case noInput
        case missUsername
        case missPassWord
    }
}

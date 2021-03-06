//
//  LoginViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: - IBOulets private variables
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var loginBtn: UIButton!
    @IBOutlet private weak var clearBtn: UIButton!
    @IBOutlet private weak var informLabel: UILabel!
    
    //MARK: - Private variables
    private var checkInput: InputValidate = .empty {
        didSet {
            if checkInput != .correct {
                showResult()
            } else {
                SceneDelegate.shared.changeFlow(with: .logined)
//                goToHomeController()
            }
        }
    }
    
    private var user = User(userName: "", password: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private functions
    private func setupUI() {
        configBarItem()
        title = "Login"
        view.subviews
            .compactMap { $0 as? UIButton}
            .forEach { configButton($0) }
    }
    
    private func configButton(_ button: UIButton) {
        button.layer.cornerRadius = 10
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.textColor = UIColor.white
    }
    
    private func showResult() {
        informLabel.text = checkInput.rawValue
    }
    
    // Compare username + password with database -> result
    @objc private func loginProcess() {
        guard let userName = userNameTextField.text,
              let password = passWordTextField.text else { return }
        user = User(userName: userName, password: password)
        checkInput = user.validateUserNamePasswordInput()
    }
    
    
    // MARK: - IBAction private functions
    @IBAction private func loginButtonTouchUpInSide(_ sender: UIButton) {
        loginProcess()
    }
    
    @IBAction private func clearButtonTouchUpInSide(_ sender: UIButton) {
        clearContent()
    }
    
    @IBAction private func clickOnNextKey(_ sender: AnyObject) {
        passWordTextField.becomeFirstResponder()
    }
    
    @IBAction private func clickOnDoneKey(_ sender: AnyObject) {
        loginProcess()
        view.endEditing(true)
    }
    
    @IBAction private func registerTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @IBAction private func forgotPasswordTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(ForgotPassWordViewController(), animated: true)
    }
    
    //MARK: - Override function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

extension LoginViewController {
    
    //MARK: - Extension private functions
    private func configBarItem() {
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(loginProcess))
        navigationItem.rightBarButtonItem = doneButton
        let logoutButton = UIBarButtonItem()
        logoutButton.title = "Logout"
        navigationItem.backBarButtonItem = logoutButton
    }
    
    private func goToHomeController() {
        navigationController?.pushViewController(HomeNaviViewController(user: user), animated: true)
    }
    
    private func clearContent() {
        userNameTextField.text = ""
        passWordTextField.text = ""
        informLabel.text = ""
        userNameTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearContent()
    }
}

//
//  EditViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/7/22.
//

import UIKit

final class EditViewController: UIViewController {
    
    //MARK: - IBOutlet private variables
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var informLabel: UILabel!
    
    private var user = User(userName: "", password: "")
    weak var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private functions
    private func setupUI() {
        title = "Edit"
        usernameTextField.text = user.userName
        configBarItem()
        view.subviews
            .compactMap { $0 as? UITextField }
            .forEach { configTextField($0) }
    }
    
    private func configTextField(_ textField: UITextField) {
        textField.font = .boldSystemFont(ofSize: 20)
    }
    
    private func configBarItem() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(changePassword))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func checkConfirmPassword() -> Bool {
        if newPasswordTextField.text == confirmPasswordTextField.text {
            return true
        }
        return false
    }
    
    @objc private func changePassword() {
        if checkConfirmPassword() {
            delegate?.sendInform(with: self, message: "Change Password Sucess")
            navigationController?.popViewController(animated: true)
        } else {
            informLabel.text = "Mật khẩu không trùng khớp"
        }
    }
}

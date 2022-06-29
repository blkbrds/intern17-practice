//
//  EditViewController.swift
//  BTNavigation
//
//  Created by Tuan Tran V. VN.Danang on 5/23/22.
//

import UIKit

final class EditViewController: UIViewController {
    var username: String?
    weak var delegate: EditViewControllerDelegate?
    
    //MARK: -IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let username = self.username {
            usernameTextField.text = username
        }
    }
    
    private func setupView() {
        title = "Edit"
        errorLabel.isHidden = true
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func doneTapped() {
        if let username = usernameTextField.text {
            delegate?.editViewController(editViewController: self, performNeeded: .update(text: username))
        }
        navigationController?.popViewController(animated: true)
    }

}

protocol EditViewControllerDelegate: class {
    func editViewController(editViewController: EditViewController, performNeeded: EditViewController.Action )
}

extension EditViewController {
    enum Action {
        case update(text: String)
    }
}

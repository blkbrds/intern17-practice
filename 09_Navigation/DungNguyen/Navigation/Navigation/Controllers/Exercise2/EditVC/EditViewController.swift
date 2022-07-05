//
//  EditViewController.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/29/22.
//

import UIKit

// MARK: - Protocols
protocol EditViewControllerDelegate: AnyObject {
    func controller(viewController: EditViewController, username: String)
}

final class EditViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    
    // MARK: - MARK: - Properties
    var username: String = ""
    weak var delegate: EditViewControllerDelegate?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Private methods
    private func configView() {
        title = "Edit"
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneButton
        usernameTextField.text = "\(username)"
    }
    
    // MARK: - Private methods
    @objc private func cancelAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneAction() {
        if let username = usernameTextField.text {
            delegate?.controller(viewController: self, username: username)
        }
        navigationController?.popViewController(animated: true)
    }
}

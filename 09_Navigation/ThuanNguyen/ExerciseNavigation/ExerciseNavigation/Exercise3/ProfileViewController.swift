//
//  ProfileViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 18/05/2022.
//

import UIKit
protocol ProfileControllerDelegate: class {
    func updateController(view: ProfileViewController, needsPerform action: ProfileViewController.Action)
}

class ProfileViewController: UIViewController {
    enum Action {
        case tap(user: String, index: Int)
    }
    
    @IBOutlet private weak var nameTextField: UITextField!
    weak var delegate: ProfileControllerDelegate?
    var nameuser: String = " "
    var userIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Profile"
        nameTextField.text = nameuser
    }
    
    private func setupUI() {
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func rightAction() {
        if let us = nameTextField.text, let delegate = delegate {
            delegate.updateController(view: self, needsPerform: .tap(user: us, index: userIndex))
        }
        self.navigationController?.popViewController(animated: true)
    }
}


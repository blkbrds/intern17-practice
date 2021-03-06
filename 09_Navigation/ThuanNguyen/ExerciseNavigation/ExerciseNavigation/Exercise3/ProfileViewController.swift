//
//  ProfileViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 18/05/2022.
//

import UIKit
protocol ProfileControllerDelegate: class {
    func updateController(viewController: ProfileViewController, needsPerform action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {
    enum Action {
        case tap(user: String, index: Int)
    }
    
    @IBOutlet private weak var nameTextField: UITextField!
    weak var delegate: ProfileControllerDelegate?
    var nameUser: String = " "
    var userIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Profile"
        nameTextField.text = nameUser
    }
    
    private func setupUI() {
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func rightAction() {
        if let user = nameTextField.text, let delegate = delegate {
            delegate.updateController(viewController: self, needsPerform: .tap(user: user, index: userIndex))
        }
        self.navigationController?.popViewController(animated: true)
    }
}


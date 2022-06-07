//
//  EditViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 16/05/2022.
//

import UIKit
protocol EditControllerDelegate: class {
    func updateController(viewController: EditViewController, needsPerform action: EditViewController.Action)
}

final class EditViewController: UIViewController {
    
    enum Action {
        case tap(username: String)
    }
    
    @IBOutlet private weak var usernamelTextField: UITextField!
    @IBOutlet private weak var newpassTextField: UITextField!
    @IBOutlet private weak var confirmTextField: UITextField!
    
    weak var delegate: EditControllerDelegate?
    var nameuser: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        setupUI()
        usernamelTextField.text = nameuser
    }
    
    private func setupUI() {
        let leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftAction))
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
    }
    
    @objc private func leftAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func rightAction() {
        if let us = usernamelTextField.text, let delegate = delegate {
            delegate.updateController(viewController: self, needsPerform: .tap(username: us))
        }
        self.navigationController?.popViewController(animated: true)
    }
}

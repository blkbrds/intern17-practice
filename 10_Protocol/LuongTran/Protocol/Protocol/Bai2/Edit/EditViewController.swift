//
//  EditViewController.swift
//  Protocol
//
//  Created by luong.tran on 13/09/2022.
//

import UIKit

protocol EditViewControllerDelegate: AnyObject {
    func vc(vc: EditViewController, needPerform action: EditViewController.Action)
}

final class EditViewController: UIViewController {
    
    enum Action {
        case updateUsername(userName: String)
    }
    
    weak var delegate: EditViewControllerDelegate?
    
    @IBOutlet private weak var editTextField: UITextField!
    var userText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigation()
        configUI()
    }
    
    private func configNavigation() {
        title = Define.titleBar
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configUI() {
        editTextField.text = userText
    }
    
    @objc private func doneButtonTouchUpInSide() {
        guard let newName = editTextField.text else { return }
        delegate?.vc(vc: self, needPerform: .updateUsername(userName: newName))
        navigationController?.popViewController(animated: true)
    }
    
}


extension EditViewController {
    private struct Define {
        static let titleBar = "Profile"
    }
}



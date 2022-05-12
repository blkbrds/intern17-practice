//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Tinh Bui T. VN.Danang on 5/11/22.
//

import UIKit

protocol ProfileViewDelegate: class {
    func view(view: ProfileViewController, needPerform action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameAvatarUITextField: UITextField!
    weak var delegate: ProfileViewDelegate?
    var nameAvatar = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneButton
        
        nameAvatarUITextField.text = nameAvatar
    }
    
    init(with name: String) {
        self.nameAvatar = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func done() {
        guard let newNameAvatar = nameAvatarUITextField.text else { return }
        delegate?.view(view: self, needPerform: .sendData(value: newNameAvatar))
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController {
    enum Action {
        case sendData(value: String)
    }
}

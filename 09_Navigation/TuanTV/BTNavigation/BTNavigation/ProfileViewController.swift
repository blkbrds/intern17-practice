//
//  ProfileViewController.swift
//  BTNavigation
//
//  Created by Tuan Tran V. VN.Danang on 5/24/22.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileViewControllerDelegate?
    var person: Person?
    var index: Int?
    
    //MARK: -IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        guard let person = person,
              let image = person.image,
              let name = person.name
        else { return }
        avatarImageView.image = UIImage(named: image)
        nameTextField.text = name
        let doneButton = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func doneTapped() {
        if let index = index,
           let name = nameTextField.text {
            let person = Person(name: name, image: "user")
            delegate?.profileViewController(profileViewController: self, performNeeded: .update(index: index, person: person))
        }
        navigationController?.popViewController(animated: true)
    }
}
protocol ProfileViewControllerDelegate: class {
    func profileViewController(profileViewController: ProfileViewController, performNeeded: ProfileViewController.Action )
}

extension ProfileViewController {
    enum Action {
        case update(index: Int, person: Person)
    }
}

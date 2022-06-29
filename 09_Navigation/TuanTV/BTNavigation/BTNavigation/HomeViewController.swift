//
//  HomeViewController.swift
//  BTNavigation
//
//  Created by Tuan Tran V. VN.Danang on 5/23/22.
//

import UIKit

struct Person {
    var name: String?
    var image: String?
}

final class HomeViewController: UIViewController {

    private let spaceAvatar: Int = 10
    var loginUsername: String = ""
    var persons: [Person] = []
    
    //MARK: -IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var welcomeLabel: UILabel!
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<30 {
            persons.append(Person(name: "name \(i)",
                                 image: "user"))
        }
        setupView()
    }
    
    private func setupView() {
        welcomeLabel.text = "Welcome \(loginUsername)"
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .orange
        navigationController?.navigationBar.tintColor = .brown
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        navigationItem.rightBarButtonItem = editButton
        updateUI()
    }
    
    private func updateUI() {
        for i in 0..<persons.count {
            let x: Int = 20 + (100 + spaceAvatar) * ((i - 1) % 3)
            let y: Int = 0 + (120 + spaceAvatar) * Int((i - 1) / 3)
            let avatar = Bundle.main.loadNibNamed("Avatar", owner: self, options: nil)?[0] as? Avatar
            avatar?.delegate = self
            avatar?.frame = CGRect(x: x, y: y, width: 100, height: 120)
            avatar?.nameLabel.text = persons[i].name
            if let image = persons[i].image {
                avatar?.avatarImageView.image = UIImage(named: image)
            }
            scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
            scrollView.addSubview(avatar!)
        }
    }
    
    @objc private func editTapped() {
        let vc = EditViewController()
        vc.username = loginUsername
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

protocol AvatarDelegate: class {
    func avatar (_ myAvatar: Avatar, didSelect name: String)
}

extension HomeViewController: AvatarDelegate {
    func avatar(_ myAvatar: Avatar, didSelect name: String) {
        let vc = ProfileViewController()
        vc.delegate = self
        if let index = Int(name.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
            vc.index = index
            vc.person = persons[index]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: EditViewControllerDelegate {
    func editViewController(editViewController: EditViewController, performNeeded: EditViewController.Action) {
        switch performNeeded {
        case .update(text: let text):
            welcomeLabel.text = "Welcome " + text
        }
    }
}

extension HomeViewController: ProfileViewControllerDelegate {
    func profileViewController(profileViewController: ProfileViewController, performNeeded: ProfileViewController.Action) {
        switch performNeeded {
        case .update(index: let index, person: let person):
            persons[index] = person
            updateUI()
        }
    }
}

//
//  ProfileViewController.swift
//  Tabbar
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

final class ProfileViewController: UIViewController, Coordinating {
    var coodinator: Coordinator?
    
    var viewModel = ProfileViewModel()
    

    @IBOutlet private weak var logoutLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        let tap = UITapGestureRecognizer(target: self, action: #selector(logOutButtonTouchUpInside))
        logoutLabel.isUserInteractionEnabled = true
        logoutLabel.addGestureRecognizer(tap)
    }
    
    private func configNavigation() {
        title = Define.title
    }
    
    @objc private func logOutButtonTouchUpInside(sender: UITapGestureRecognizer) {
        viewModel.destroyDB()
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        delegate.changeRootToLogin()
    }
}

extension ProfileViewController {
    private struct Define {
        static var title: String = "Profile"
    }
}

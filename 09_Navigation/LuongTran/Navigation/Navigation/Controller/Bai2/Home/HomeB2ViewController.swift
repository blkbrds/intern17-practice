//
//  HomeB2ViewController.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

final class HomeB2ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configNavigation()
        configUI()
    }
    
    private func configNavigation() {
        title = Define.titleBar
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = editButton
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTouchUpInSide))
        navigationItem.leftBarButtonItem = logoutButton
    }
    
    private func configUI() {
        titleLabel.text = "Welcome \n \(username)"
    }
    
    @objc private func editButtonTouchUpInSide() {
        let editVC = EditB2ViewController()
        editVC.delegate = self
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    @objc private func logoutButtonTouchUpInSide() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension HomeB2ViewController {
    private struct Define {
        static let titleBar: String = "Home"
    }
}

extension HomeB2ViewController: EditB2ViewControllerDelegate {
    func vc(vc: EditB2ViewController, needPerform action: EditB2ViewController.Action) {
        switch action {
        case .changeUsername(name: let userName):
            titleLabel.text = "Welcome \n \(userName)"
        }
    }
}



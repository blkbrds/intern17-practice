//
//  HomeViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 16/05/2022.
//

import UIKit
protocol HomViewControllerDelegate: class {
    func controller(viewController: HomeViewController, needsPerform action: HomeViewController.Action)
}

final class HomeViewController: UIViewController {
    enum Action {
        case logout
    }
    
    @IBOutlet private weak var usernameLabel: UILabel!
    var username: String = ""
    weak var delegate: HomViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupUI()
        usernameLabel.text = username
    }
    
    private func setupUI() {
        let leftButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(leftAction))
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func leftAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func rightAction() {
        let vc = EditViewController()
        vc.delegate = self
        vc.nameuser = username
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: EditControllerDelegate {
    func updateController(viewController: EditViewController, needsPerform actions: EditViewController.Action) {
        switch actions {
        case.tap(let userName):
            usernameLabel.text = userName
        }
    }
}


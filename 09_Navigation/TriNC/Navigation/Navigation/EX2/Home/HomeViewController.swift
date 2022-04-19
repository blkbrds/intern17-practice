//
//  HomeViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

// MARK: - Protocol
protocol HomeViewControllerDelegate: class {
    func homeController(view: HomeViewController, needsPerform action: HomeViewController.Action)
}

final class HomeViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var welcomeLabel: UILabel!

    // MARK: - Properties
    var username: String = ""
    weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI () {
        title = "Home"
        
        // navigation Bar
        let editBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editingAction))
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutAction))
        navigationItem.rightBarButtonItem = editBarButtonItem
        navigationItem.leftBarButtonItem = logoutBarButtonItem
        
        welcomeLabel.text = "Welcome \(username)"
    }
    
    @objc private func editingAction() {
        let vc = EditViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func logoutAction() {
        if let delegate = delegate {
            delegate.homeController(view: self, needsPerform: .logout)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extention
extension HomeViewController {
    // MARK: - Define Action
    enum Action {
        case logout
    }
}

// MARK: - Implement EditProtocol
extension HomeViewController: EditViewControllerDelegate {
    func didTapEditViewController(view: EditViewController, needsPeform action: EditViewController.Action) {
        switch action {
        case .tapDone(let username):
            welcomeLabel.text = username
        }
    }
}

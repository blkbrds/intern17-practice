//
//  RegisterViewController.swift
//  TabBar
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/11/22.
//

import UIKit

final class RegisterViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Register"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleRegister))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func handleRegister() {
        // code handle register
        changeRoot(type: .tabbar)
    }
}

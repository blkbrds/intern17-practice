//
//  ForgotPasswordViewController.swift
//  TabBar
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/11/22.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "ForgotPassword"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleForgotPassword))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func handleForgotPassword() {
        // code handle forgot
        navigationController?.popViewController(animated: true)
    }
}

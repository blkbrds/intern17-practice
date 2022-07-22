//
//  ForgotPasswordViewController.swift
//  TabbarController
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/11/22.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
    }
    
    // MARK: Private function
    private func configViewController() {
        title = "Forgot password"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonAction))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    // MARK: - Objc function
    @objc private func doneButtonAction() {
        navigationController?.popToRootViewController(animated: true)
    }
}

//
//  ForgotPasswordViewController.swift
//  Tabbar
//
//  Created by luong.tran on 22/09/2022.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }
    
    private func configNavigation() {
        title = Define.title
    }
}

extension ForgotPasswordViewController {
    private struct Define {
        static var title: String = "Forgot Password"
    }
}

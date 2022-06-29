//
//  DViewController.swift
//  Navigation
//
//  Created by Tinh Bui T. VN.Danang on 5/10/22.
//

import UIKit

final class DViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC D"
    }

    // MARK: - IBActions
    @IBAction private func NextButtonTouchUpInside(_ sender: Any) {
        let vc = EViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func BButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func CButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func RootButtonTouchUpinside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

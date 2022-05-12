//
//  EViewController.swift
//  Navigation
//
//  Created by Tinh Bui T. VN.Danang on 5/10/22.
//

import UIKit

final class EViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC e"
    }

    @IBAction private func BButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func CButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func DButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[3])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func RootButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

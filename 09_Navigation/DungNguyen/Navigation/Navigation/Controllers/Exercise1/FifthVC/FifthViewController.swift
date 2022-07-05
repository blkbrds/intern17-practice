//
//  FifthViewController.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/29/22.
//

import UIKit

final class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ViewControllerE"
    }
    
    @IBAction private func popControllerSecond(_ sender: Any) {
        if let vc = (self.navigationController?.viewControllers[1]) {
            navigationController?.popToViewController(vc, animated: true)
        }
    }
    
    @IBAction private func popControllerThird(_ sender: Any) {
        if let vc = (self.navigationController?.viewControllers[2]) {
            navigationController?.popToViewController(vc, animated: true)
        }
    }
    
    @IBAction private func popControllerFourth(_ sender: Any) {
        if let vc = (self.navigationController?.viewControllers[3]) {
            navigationController?.popToViewController(vc, animated: true)
        }
    }
    
    @IBAction private func popRootButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

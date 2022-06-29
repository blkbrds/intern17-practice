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
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popControllerThird(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popControllerFourth(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[3])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popRootButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

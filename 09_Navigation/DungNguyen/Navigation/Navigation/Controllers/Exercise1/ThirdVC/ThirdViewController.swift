//
//  ThirdViewController.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/29/22.
//

import UIKit

final class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ViewControllerC"
    }
    
    @IBAction private func nextButton(_ sender: Any) {
        let vc = FourthViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func preButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func popRootButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

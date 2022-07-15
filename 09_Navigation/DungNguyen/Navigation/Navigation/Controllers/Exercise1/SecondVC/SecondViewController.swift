//
//  SecondViewController.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/29/22.
//

import UIKit

final class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ViewControllerB"
    }
    
    @IBAction private func nextButton(_ sender: Any) {
        let vc = ThirdViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func preButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}

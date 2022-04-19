//
//  ExDViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

final class ExDViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController D"
    }
    
    // MARK: - IBActions
    @IBAction private func nextButtonTouchUpinside(_ sender: Any) {
        let vc = ExEViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func cButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func bButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

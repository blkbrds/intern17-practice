//
//  ExEViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

final class ExEViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
    }
    
    // MARK: - IBAction
    @IBAction private func cButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func bButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func dButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

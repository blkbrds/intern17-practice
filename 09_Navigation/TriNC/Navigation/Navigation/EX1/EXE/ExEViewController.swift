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
    
    // MARK: - IBActions
    @IBAction private func cButtonTouchUpInside(_ sender: Any) {
        guard let vc = (self.navigationController?.viewControllers[2]) else { return }
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func bButtonTouchUpInside(_ sender: Any) {
        guard let vc = (self.navigationController?.viewControllers[1]) else { return }
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func dButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

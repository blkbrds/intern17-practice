//
//  ExCViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

final class ExCViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController C"
    }
    
    // MARK: - IBActions
    @IBAction private func nextTouchUpInside(_ sender: Any) {
        let vc = ExDViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func previousButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

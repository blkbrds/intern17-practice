//
//  ExBViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

final class ExBViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
    }
    
    // MARK: - IBActions
    @IBAction private func nextScreenCButtonTouchUpInside(_ sender: Any) {
        let vc = ExCViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func previousScreenAButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//
//  ExerciseAViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

final class ExerciseAViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController A"
    }
    
    // MARK: - IBAction
    @IBAction private func nextScreenBButtonTouchUpInside(_ sender: Any) {
        let vc = ExBViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

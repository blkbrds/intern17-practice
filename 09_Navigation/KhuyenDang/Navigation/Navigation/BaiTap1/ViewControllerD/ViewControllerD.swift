//
//  ViewControllerD.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

final class ViewControllerD: UIViewController {

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerD"
    }

    //MARK: - IBActions
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let viewE = ViewControllerE()
        navigationController?.pushViewController(viewE, animated: true)
    }

    @IBAction private func cButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func bButtonTouchUpInside(_ sender: Any) {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let viewControllerB = navController.viewControllers[1]
            navigationController?.popToViewController(viewControllerB, animated: true)
        }
    }

    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

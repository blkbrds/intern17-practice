//
//  ViewControllerE.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

final class ViewControllerE: UIViewController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerE"
    }

    //MARK: - IBActions
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction private func dButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func cButtonTouchUpInside(_ sender: Any) {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let viewControllerC = navController.viewControllers[2]
            navigationController?.popToViewController(viewControllerC, animated: true)
        }
    }

    @IBAction private func bButtonTouchUpInside(_ sender: Any) {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let viewControllerB = navController.viewControllers[1]
            navigationController?.popToViewController(viewControllerB, animated: true)
        }
    }
}

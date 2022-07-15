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
        let vcE = ViewControllerE()
        navigationController?.pushViewController(vcE, animated: true)
    }

    @IBAction private func cButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func bButtonTouchUpInside(_ sender: Any) {
        guard let navigationController =  navigationController else {
            return
        }
        for controller in navigationController.viewControllers where controller is ViewControllerB {
            navigationController.popToViewController(controller, animated: true)
        }
    }

    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

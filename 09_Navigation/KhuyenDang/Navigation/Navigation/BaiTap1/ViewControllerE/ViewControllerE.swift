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
    @IBAction private func rootButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction private func dButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func cButton(_ sender: Any) {
        for controller in navigationController!.viewControllers where controller is ViewControllerC {
            navigationController?.popToViewController(controller, animated: true)
        }
    }

    @IBAction private func bButton(_ sender: Any) {
        for controller in navigationController!.viewControllers where controller is ViewControllerB {
            navigationController?.popToViewController(controller, animated: true)
        }
    }
}

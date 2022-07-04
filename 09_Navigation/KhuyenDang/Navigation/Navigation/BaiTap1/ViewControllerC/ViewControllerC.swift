//
//  ViewControllerC.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

final class ViewControllerC: UIViewController {

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerC"
    }

    //MARK: - IBActions
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let vcD = ViewControllerD()
        navigationController?.pushViewController(vcD, animated: true)
    }

    @IBAction private func preButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootButtonTouchUpInside(TouchUpInside_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

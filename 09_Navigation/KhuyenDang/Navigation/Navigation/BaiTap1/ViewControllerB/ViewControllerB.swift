//
//  ViewControllerB.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

final class ViewControllerB: UIViewController {

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerB"
    }

    //MARK: - IBActions
    @IBAction private func preButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let vcC = ViewControllerC()
        navigationController?.pushViewController(vcC, animated: true)
    }
}

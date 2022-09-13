//
//  ViewControllerB.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

final class ViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "View B"
    }

    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let viewC = ViewControllerC()
        navigationController?.pushViewController(viewC, animated: true)
    }
    @IBAction private func prevButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

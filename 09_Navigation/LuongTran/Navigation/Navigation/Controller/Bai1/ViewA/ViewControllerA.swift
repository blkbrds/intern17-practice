//
//  ViewControllerA.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

final class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "View A"
    }


    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let viewB = ViewControllerB()
        navigationController?.pushViewController(viewB, animated: true)
    }
}

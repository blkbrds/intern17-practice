//
//  ViewControllerA.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

final class ViewControllerA: UIViewController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerA"
    }

    //MARK: - IBAction
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let vcB = ViewControllerB()
        navigationController?.pushViewController(vcB, animated: true)
    }
}

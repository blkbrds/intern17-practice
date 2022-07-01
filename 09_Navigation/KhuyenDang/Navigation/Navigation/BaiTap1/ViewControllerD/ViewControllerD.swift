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
    @IBAction private func nextButton(_ sender: Any) {
        let viewE = ViewControllerE()
        navigationController?.pushViewController(viewE, animated: true)
    }
    
    @IBAction private func cButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func bButton(_ sender: Any) {
        for controller in navigationController!.viewControllers where controller is ViewControllerB {
            navigationController?.popToViewController(controller, animated: true)
        }
    }
    
    @IBAction private func rootButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

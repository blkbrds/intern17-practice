//
//  ViewControllerC.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

final class ViewControllerC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "View C"
    }
    
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        
        let viewD = ViewControllerD()
        navigationController?.pushViewController(viewD, animated: true)
    }
    @IBAction private func prevButtonTouchUpInside(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}

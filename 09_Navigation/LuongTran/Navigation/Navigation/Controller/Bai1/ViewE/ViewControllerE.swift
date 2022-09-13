//
//  ViewControllerE.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

final class ViewControllerE: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "View E"
    }
    @IBAction func viewBButtonTouchUpInside(_ sender: Any) {
        guard let VC = self.navigationController?.viewControllers.filter({$0.isKind(of: ViewControllerB.self)}).first else {return}
        self.navigationController?.popToViewController(VC, animated: true)
    }
    @IBAction func viewCButtonTouchUpInside(_ sender: Any) {
        guard let VC = self.navigationController?.viewControllers.filter({$0.isKind(of: ViewControllerC.self)}).first else {return}
        self.navigationController?.popToViewController(VC, animated: true)
    }
    @IBAction func viewDButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

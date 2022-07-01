//
//  BT10ViewController.swift
//  Autolayout
//
//  Created by tu.le2 on 24/06/2022.
//

import UIKit

struct Define {
    static let bigView: CGFloat = 297
    static let smallView: CGFloat = 148
}

final class BT10ViewController: UIViewController {
    @IBOutlet private weak var heightVioletConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightYellowConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightOrangeConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightGreenConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func handleSingleTapGreenView(_ sender: Any) {
        heightGreenConstraint.constant = Define.bigView
        heightYellowConstraint.constant = Define.smallView
        heightVioletConstraint.constant = Define.smallView
        heightOrangeConstraint.constant = Define.smallView
    }
    
    
    @IBAction private func handleSingleTapVioletView(_ sender: Any) {
        heightVioletConstraint.constant = Define.bigView
        heightYellowConstraint.constant = Define.smallView
        heightGreenConstraint.constant = Define.smallView
        heightOrangeConstraint.constant = Define.smallView
    }
    
    @IBAction private func handleSingleTapYellowView(_ sender: Any) {
        heightYellowConstraint.constant = Define.bigView
        heightVioletConstraint.constant = Define.smallView
        heightGreenConstraint.constant = Define.smallView
        heightOrangeConstraint.constant = Define.smallView
    }
    
    @IBAction private func handleSingleTapOrangeView(_ sender: Any) {
        heightOrangeConstraint.constant = Define.bigView
        heightYellowConstraint.constant = Define.smallView
        heightGreenConstraint.constant = Define.smallView
        heightVioletConstraint.constant = Define.smallView
    }
}

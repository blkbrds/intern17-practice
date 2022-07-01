//
//  BT10ViewController.swift
//  Autolayout
//
//  Created by tu.le2 on 24/06/2022.
//

import UIKit

final class BT10ViewController: UIViewController {
    @IBOutlet private weak var yellowView: UIView!
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var violetView: UIView!
    @IBOutlet private weak var orangeView: UIView!
    @IBOutlet private weak var heightVioletConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightYellowConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightOrangeConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightGreenConstraint: NSLayoutConstraint!

    
    var bigView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigView = greenView
    }
    
    @IBAction private func handleSingleTapGreenView(_ sender: Any) {
        heightGreenConstraint.constant = 297
        heightYellowConstraint.constant = 148
        heightVioletConstraint.constant = 148
        heightOrangeConstraint.constant = 148
    }
    
    
    @IBAction private func handleSingleTapVioletView(_ sender: Any) {
        heightVioletConstraint.constant = 297
        heightYellowConstraint.constant = 148
        heightGreenConstraint.constant = 148
        heightOrangeConstraint.constant = 148
    }
    
    @IBAction private func handleSingleTapYellowView(_ sender: Any) {
        heightYellowConstraint.constant = 297
        heightVioletConstraint.constant = 148
        heightGreenConstraint.constant = 148
        heightOrangeConstraint.constant = 148
    }
    
    @IBAction private func handleSingleTapOrangeView(_ sender: Any) {
        heightOrangeConstraint.constant = 297
        heightYellowConstraint.constant = 148
        heightGreenConstraint.constant = 148
        heightVioletConstraint.constant = 148
    }
}

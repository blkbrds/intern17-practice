//
//  BT10ViewController.swift
//  Autolayout
//
//  Created by tu.le2 on 24/06/2022.
//

import UIKit

class BT10ViewController: UIViewController {
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var violetView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var heightVioletConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightYellowConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightOrangeConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightGreenConstraint: NSLayoutConstraint!

    
    var bigView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigView = greenView
    }
    
    @IBAction func handleSingleTapGreenView(_ sender: Any) {
        heightGreenConstraint.constant = 297
        heightYellowConstraint.constant = 148
        heightVioletConstraint.constant = 148
        heightOrangeConstraint.constant = 148
    }
    
    
    @IBAction func handleSingleTapVioletView(_ sender: Any) {
        heightVioletConstraint.constant = 297
        heightYellowConstraint.constant = 148
        heightGreenConstraint.constant = 148
        heightOrangeConstraint.constant = 148
    }
    
    @IBAction func handleSingleTapYellowView(_ sender: Any) {
        heightYellowConstraint.constant = 297
        heightVioletConstraint.constant = 148
        heightGreenConstraint.constant = 148
        heightOrangeConstraint.constant = 148
    }
    
    @IBAction func handleSingleTapOrangeView(_ sender: Any) {
        heightOrangeConstraint.constant = 297
        heightYellowConstraint.constant = 148
        heightGreenConstraint.constant = 148
        heightVioletConstraint.constant = 148
    }
    
    private func changeBigView() {
        switch bigView {
        case orangeView:
            orangeView.heightAnchor.constraint(equalToConstant: 148).isActive = true
        case yellowView:
            yellowView.heightAnchor.constraint(equalToConstant: 148).isActive = true
        case violetView:
            violetView.heightAnchor.constraint(equalToConstant: 148).isActive = true
        case greenView:
            greenView.heightAnchor.constraint(equalToConstant: 148).isActive = true
        default:
            return
        }
        
    }
    
}

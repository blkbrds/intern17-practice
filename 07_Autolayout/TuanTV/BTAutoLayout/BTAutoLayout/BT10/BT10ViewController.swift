//
//  BT10ViewController.swift
//  BTAutoLayout
//
//  Created by Tuan Tran V. VN.Danang on 5/17/22.
//

import UIKit

final class BT10ViewController: UIViewController {
    
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var blackView: UIView!
    
    var currentView: UIView = UIView()
    var yCurrentView: CGFloat!
    var yDefault: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let greenTap = UITapGestureRecognizer(target: self, action: #selector(handleGreenTap(sender:)))
        greenView.addGestureRecognizer(greenTap)
        let purpleTap = UITapGestureRecognizer(target: self, action: #selector(handlePurpleTap(sender:)))
        purpleView.addGestureRecognizer(purpleTap)
        let orangeTap = UITapGestureRecognizer(target: self, action: #selector(handleOrangeTap(sender:)))
        orangeView.addGestureRecognizer(orangeTap)
        let blackTap = UITapGestureRecognizer(target: self, action: #selector(handleBlackTap(sender:)))
        blackView.addGestureRecognizer(blackTap)
        currentView = greenView
        yCurrentView = greenView.frame.origin.y
        yDefault = greenView.frame.origin.y
    }
    @objc func handleGreenTap(sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            if currentView != greenView {
                handleAnimation(changeView: greenView)
            }
        }
    }
    
    @objc func handlePurpleTap(sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            if currentView != purpleView {
                handleAnimation(changeView: purpleView)
            }
        }
    }
    
    @objc func handleOrangeTap(sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            if currentView != orangeView {
                handleAnimation(changeView: orangeView)
            }
        }
    }
    
    @objc func handleBlackTap(sender: UITapGestureRecognizer) {
        guard let view = sender.view else { return }
        if sender.state == .ended {
            if currentView != blackView {
                handleAnimation(changeView: blackView)
            }
        }
    }
    
    private func handleAnimation(changeView: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn) {
            self.currentView.transform = self.currentView.transform.scaledBy(x: 0.5, y: 0.5)
            changeView.transform = changeView.transform.scaledBy(x: 2, y: 2)
            self.changeYPosition()
            self.currentView = changeView
        } completion: { _ in
        }
    }
    
    private func changeYPosition() {
        yCurrentView = yDefault
        greenView.frame.origin.y = yCurrentView
        yCurrentView += greenView.frame.size.height + 20
        purpleView.frame.origin.y = yCurrentView
        yCurrentView += purpleView.frame.size.height + 20
        orangeView.frame.origin.y = yCurrentView
        yCurrentView += orangeView.frame.size.height + 20
        blackView.frame.origin.y = yCurrentView
    }
}

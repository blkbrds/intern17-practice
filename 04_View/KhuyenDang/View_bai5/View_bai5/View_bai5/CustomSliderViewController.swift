//
//  CustomSliderViewController.swift
//  View_bai5
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/16/22.
//

import UIKit

final class CustomSliderViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var greenColorView: UIView!
    @IBOutlet private weak var orangeColorView: UIView!
    @IBOutlet private weak var blueColorView: UIView!
    @IBOutlet private weak var indexLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orangeColorView.layer.cornerRadius = 30
        indexLabel.text = "50"
    }
    
    // MARK: - Private methods
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            if touch.view == orangeColorView {
                let location = touch.location(in: containerView)
                if location.y < containerView.bounds.minY {
                    orangeColorView.center.y = containerView.bounds.minY
                } else if location.y > containerView.bounds.maxY {
                    orangeColorView.center.y = containerView.bounds.maxY
                } 
                else {
                    orangeColorView.center.y = location.y
                }
                blueColorView.frame = CGRect(x: greenColorView.frame.origin.x, y: orangeColorView.center.y, width: greenColorView.frame.width, height: (greenColorView.frame.height - orangeColorView.center.y))
                let percent = Int((blueColorView.frame.height / greenColorView.frame.height) * 100)
                indexLabel.text = "\(percent)"
            }
        }
    }
    // MARK: - IBAction
    
    
    
}

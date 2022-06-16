//
//  CustomSliderViewController.swift
//  View_bai5
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/16/22.
//

import UIKit

final class CustomSliderViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var greenColorView: UIView!
    @IBOutlet weak var orangeColorView: UIView!
    @IBOutlet weak var blueColorView: UIView!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orangeColorView.layer.cornerRadius = 30
        indexLabel.text = "50"
    }
    
    // MARK: - Private methods
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
                
                var percent = Int((blueColorView.frame.height / greenColorView.frame.height) * 100)
                indexLabel.text = "\(percent)"
            }
        }
    }
    // MARK: - IBAction
    
    
    
}

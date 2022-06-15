//
//  CustomSliderViewController.swift
//  View
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/14/22.
//

import UIKit

class CustomSliderViewController: UIViewController {
    
    var number: Int = 50 {
        didSet {
            // tinh frame mau do hoac xanh
            let newBlueHeight = blueView.frame.size.height + (blueView.frame.origin.y - orangeView.center.y)
            // cap nhat lai title
            numberLabel.text = "\(number)"
        }
    }

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var parentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orangeView.layer.cornerRadius = 25
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                if touch.view == orangeView {
                    let location = touch.location(in: parentView)
                    if location.y < parentView.bounds.minY {
                        orangeView.center.y = parentView.bounds.minY
                    } else if location.y > parentView.bounds.maxY {
                        orangeView.center.y = parentView.bounds.maxY
                    } else {
                        orangeView.center.y = location.y
                        // tinh dc %
                        blueView.frame = CGRect(x: blueView.frame.origin.x, y: orangeView.center.y, width: whiteView.frame.width, height: whiteView.frame.height - orangeView.center.y)
                        let percent = Int((blueView.frame.height / parentView.frame.height) * 100)
                        // number = %
                        number = percent
                    }
                }
            }
        }
}



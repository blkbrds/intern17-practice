//
//  CustomSliderViewController.swift
//  BaiTap5
//
//  Created by tu.le2 on 13/06/2022.
//

import UIKit

class CustomSliderViewController: UIViewController {
    @IBOutlet weak var buttonSlider: UIView!
    @IBOutlet weak var blueSlider: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var valuePoint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valuePoint.text = "\(50)"
        buttonSlider.layer.cornerRadius = 30
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == buttonSlider {
                let location = touch.location(in: parentView)
                if location.y > parentView.bounds.maxY {
                    buttonSlider.center.y = parentView.bounds.maxY
                } else if location.y < parentView.bounds.minY {
                    buttonSlider.center.y = parentView.bounds.minY
                } else {
                    buttonSlider.center.y = location.y
                }
                var newHeightBlueSlider: CGFloat {
                    return blueSlider.frame.size.height + (blueSlider.frame.origin.y - buttonSlider.center.y)
                }
                var value: CGFloat {
                    return (newHeightBlueSlider / redView.frame.size.height) * 100
                }
               
                blueSlider.frame = CGRect(x: blueSlider.frame.origin.x, y: buttonSlider.center.y, width: blueSlider.frame.size.width, height: newHeightBlueSlider)
                valuePoint.text = "\(Int(value))"
            }
        }
    }
}

//
//  BackgroundColorViewController.swift
//  View
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/14/22.
//

import UIKit

final class BackgroundColorViewController: UIViewController {
    
    var red: Float = 0.5
    var green: Float = 0.5
    var blue: Float = 0.5
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var backgroundColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColor()
    }
    
    func setupColor() {
        titleLabel.text = "Color R: \(String(format: "%.2f", red)), G: \(String(format: "%.2f", green)), B: \(String(format: "%.2f", blue))"
        backgroundColorView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    @IBAction private func changedSlider(_ sender: UISlider) {
        if sender.tag == 0 {
            // 0 = red
            red = sender.value
        } else if sender.tag == 1 {
            // 1 = green
            green = sender.value
        } else if sender.tag == 2 {
            // 2 = blue
            blue = sender.value
        }
        setupColor()
    }
}

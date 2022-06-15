//
//  BackgroundColorViewController.swift
//  View
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/14/22.
//

import UIKit

class BackgroundColorViewController: UIViewController {
    
    var red: Float = 0.5
    var green: Float = 0.5
    var blue: Float = 0.5
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColor()
    }
    
    func setupColor() {
        titleLabel.text = "Color R: \(red), G: \(green), B: \(blue)"
        backgroundColorView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    @IBAction func redSliderChangedValue(_ sender: Any) {
//        let slider = sender as! UISlider
//        print(slider.value)
//        red = slider.value
//        setupColor()
    }
    
    @IBAction func greenSliderChangedValue(_ sender: Any) {
//        let slider = sender as! UISlider
//        print(slider.value)
//        green = slider.value
    }
    
    @IBAction func blueSliderChangedValue(_ sender: Any) {
//        let slider = sender as! UISlider
//        blue = slider.value
    }
    
    @IBAction func changedSlider(_ sender: UISlider) {
        print("OK = \(sender.value)")
        if sender.tag == 0 {
            // 0 = red
            red = sender.value
            setupColor()
        } else if sender.tag == 1 {
            // 1 = green
            green = sender.value
            setupColor()
        } else if sender.tag == 2 {
            // 2 = blue
            blue = sender.value
            setupColor()
        }
    }
}

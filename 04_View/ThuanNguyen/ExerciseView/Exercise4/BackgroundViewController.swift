//
//  BackgroundViewController.swift
//  ViewEX4
//
//  Created by thuan.nguyen on 20/04/2022.
//

import UIKit

class BackgroundViewController: UIViewController {
//    var red: Float = 0.5
//    var green: Float = 0.5
//    var blue: Float = 0.5
    
    @IBOutlet weak var bgrColor: UIView!
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var labelColor: UILabel!
    
    var red: Float = 0.5
    var blue: Float = 0.5
    var green: Float = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
//    private func setUI() {
//        let redSlider: Int = Int(red * 225)
//        let greenSlider: Int = Int(green * 225)
//        let blueSlider: Int = Int(blue * 225)
//
//        labelColor.text = "r: \(redSlider) , g: \(greenSlider), b: \(blueSlider)"
//        bgrColor.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
//
//        sliderRed.text = "Red"
//        sliderGreen.text = "Green"
//        sliderBlue.text = "Blue"
//    }
    
//    @IBAction func sliderChanged(_ sender: Any) {
//
//        let redValue = CGFloat(sliderRed.value)
//        let greenValue = CGFloat(sliderGreen.value)
//        let blueValue = CGFloat(sliderBlue.value)
//        labelColor.text = "r:\(redValue), g:\(greenValue), b:\(blueValue)"
//        bgrColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
//    }
    
    
    @IBAction func sliderChanged(_ sender: Any) {
        
        let redValue = CGFloat(sliderRed.value) / 255
        let greenValue = CGFloat(sliderGreen.value) / 255
        let blueValue = CGFloat(sliderBlue.value) / 255
        labelColor.text = "r:\(redValue), g:\(greenValue), b:\(blueValue)"
        bgrColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    
}

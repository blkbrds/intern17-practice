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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        let redValue = CGFloat(sliderRed.value)
        let greenValue = CGFloat(sliderGreen.value)
        let blueValue = CGFloat(sliderBlue.value)
        labelColor.text = "r:\(redValue), g:\(greenValue), b:\(blueValue)"
        bgrColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    @IBAction func sliderRedAction(_ sender: UISlider) {
        
    }

    @IBAction func sliderGreenAction(_ sender: UISlider) {
    }
    
    @IBAction func sliderBlueAction(_ sender: UISlider) {
    }
    
}

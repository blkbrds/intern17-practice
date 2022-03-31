//
//  HomeViewController.swift
//  Baitap04
//
//  Created by Phong Huynh N. VN.Danang on 3/30/22.
//

import UIKit

class Bai4ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorView: UIView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = 50
        greenSlider.value = 50
        blueSlider.value = 100
    }
    
    @IBAction func moveRedSlider(_ sender: Any) {
        changeSlider(r: redSlider.value, g: greenSlider.value, b: blueSlider.value)
        
    }
    
    func changeSlider(r: Float, g: Float, b: Float) {
        titleLabel.text = "Color(R: \(Int(r)), G: \(Int(g)), B: \(Int(b))"
        colorView.backgroundColor = UIColor(
            red: CGFloat(r / 255),
            green: CGFloat(g / 255),
            blue: CGFloat(b / 255),
            alpha: 1.0
        )
    }
}

//
//  ColorViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/30/22.
//

import UIKit

class ColorViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var informColorLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    //MARK: - Variables
    private var redX: Float = 0.3921568627 {
        didSet {
            setColor(red: CGFloat(redX), green: CGFloat(greenX), blue: CGFloat(blueX))
            informRGBColor()
        }
    }
    private var greenX: Float = 0.3921568627 {
        didSet {
            setColor(red: CGFloat(redX), green: CGFloat(greenX), blue: CGFloat(blueX))
            informRGBColor()
        }
    }
    private var blueX: Float = 0.3921568627 {
        didSet {
            setColor(red: CGFloat(redX), green: CGFloat(greenX), blue: CGFloat(blueX))
            informRGBColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Color change"
        setupUI()
    }
    
    private func setupUI() {
        informRGBColor()
        setColor(red: CGFloat(redX), green: CGFloat(greenX), blue: CGFloat(blueX))
    }
    
    //MARK: - functions
    private func setColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    private func informRGBColor() {
        let redIndex = round(Double(redX) * 10) / 10.0 * 255
        let greenIndex = round(Double(greenX) * 10) / 10.0 * 255
        let blueIndex = round(Double(blueX) * 10) / 10.0 * 255
        informColorLabel.text = "Color: (R: \(redIndex), G: \(greenIndex), B: \(blueIndex))"
    }
    
    //MARK: - IBAactions
    @IBAction func moveRedSlider(_ sender: UISlider) {
        redX = sender.value
    }
    
    @IBAction func moveGreenSlider(_ sender: UISlider) {
        greenX = sender.value
    }
    
    @IBAction func moveBlueSlider(_ sender: UISlider) {
        blueX = sender.value
    }
}

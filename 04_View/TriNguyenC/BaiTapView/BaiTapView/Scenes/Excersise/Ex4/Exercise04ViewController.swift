//
//  Exercise04ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 04/04/2022.
//

import UIKit

class Exercise04ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var rgbNamelLabel: UILabel!
    @IBOutlet weak var backgroundRgb: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // MARK: - Properties
    var red : CGFloat = 100
    var green: CGFloat = 125
    var blue: CGFloat = 150
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    
    private func setupUI() {
        rgbNamelLabel.text = "r: \(red),g: \(green), b: \(blue)"
    }
    
    private func ChangeColor() -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green / 225.0), blue: CGFloat(blue / 255.0), alpha: 1.0)
    }
    
    // MARK: - IBActions
    
    @IBAction func redSlider(_ sender: UISlider) {
        let redCurrentColor = ChangeColor()
        backgroundRgb.backgroundColor = redCurrentColor
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        let greenCurrentColor = ChangeColor()
        backgroundRgb.backgroundColor = greenCurrentColor
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        let blueCurrentColor = ChangeColor()
        backgroundRgb.backgroundColor = blueCurrentColor
    }
}

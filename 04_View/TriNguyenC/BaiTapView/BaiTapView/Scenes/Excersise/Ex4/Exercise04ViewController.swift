//
//  Exercise04ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 04/04/2022.
//

import UIKit

final class Exercise04ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var rgbNamelLabel: UILabel!
    @IBOutlet private weak var backgroundRgb: UIView!
    @IBOutlet private weak var redLabel: UILabel!
    @IBOutlet private weak var greenLabel: UILabel!
    @IBOutlet private weak var blueLabel: UILabel!
    
    // MARK: - Properties
    var red : Float = 100
    var green: Float = 125
    var blue: Float = 150
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ex04"
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        rgbNamelLabel.text = "r: \(red) , g: \(green), b: \(blue)"
        backgroundRgb.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        
        redLabel.text = "Red"
        greenLabel.text = "Green"
        blueLabel.text = "Blue"
    }
    
    // MARK: - IBActions
    @IBAction func redSlider(_ sender: UISlider) {
        let currentRedColor = sender.value
        red = currentRedColor
        setupUI()
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        let currentGreenColor = sender.value
        green = currentGreenColor
        setupUI()
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        let currentBlueColor = sender.value
        blue = currentBlueColor
        setupUI()
    }
}

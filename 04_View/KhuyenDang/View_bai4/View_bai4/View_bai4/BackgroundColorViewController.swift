//
//  BackgroundColorViewController.swift
//  View_bai4
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/16/22.
//

import UIKit

final class BackgroundColorViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var titleColorLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    // MARK: - MARK: - Properties
    var red: CGFloat = 0.5
    var green: CGFloat = 0.5
    var blue: CGFloat = 0.5
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        setUpColor()
    }
    
    // MARK: - Private methods
    private func setUpColor()  {
        titleColorLabel.text = "Color(R: \(red), G: \(green), B: \(blue))"
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    // MARK: - Objcs
    
    // MARK: - IBAction
    @IBAction private func redSliderChangeColor(_ sender: UISlider) {
        red = CGFloat(sender.value)
        setUpColor()
    }
    
    @IBAction private func greenSliderChangeColor(_ sender: UISlider) {
        green = CGFloat(sender.value)
        setUpColor()
    }
    
    @IBAction private func blueSliderChangeColor(_ sender: UISlider) {
        blue = CGFloat(sender.value)
        setUpColor()
    }
}

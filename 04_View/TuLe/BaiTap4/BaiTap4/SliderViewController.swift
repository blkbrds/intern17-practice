//
//  SliderViewController.swift
//  BaiTap4
//
//  Created by tu.le2 on 13/06/2022.
//

import UIKit

class SliderViewController: UIViewController {
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var txtRed: UILabel!
    @IBOutlet weak var txtGreen: UILabel!
    @IBOutlet weak var txtBlue: UILabel!
    
    var redValue: Float = 127 {
        didSet {
            setupUI()
        }
    }
    var blueValue: Float = 127 {
        didSet {
            setupUI()
        }
    }
    var greenValue: Float = 127 {
        didSet {
            setupUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 40
        txtRed.text = "Red"
        txtGreen.text = "Green"
        txtBlue.text = "Blue"
        txtTitle.text = "Color(R: 127, G: 127, B: 127)"
    }
    @IBAction func redValueChange(_ sender: UISlider) {
        redValue = Float(Int(sender.value))
    }
    @IBAction func greenValueChange(_ sender: UISlider) {
        greenValue = Float(Int(sender.value))
    }
    @IBAction func blueValueChange(_ sender: UISlider) {
        blueValue = Float(Int(sender.value))
    }
    func setupUI() {
        txtTitle.text = "Color(R: \(redValue), \(greenValue), \(blueValue))"
        viewColor.backgroundColor = UIColor(red: CGFloat(redValue/255), green: CGFloat(greenValue/255), blue: CGFloat(blueValue/255), alpha: 1)
    }
    
}

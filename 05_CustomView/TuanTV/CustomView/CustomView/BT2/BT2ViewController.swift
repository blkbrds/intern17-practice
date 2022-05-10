//
//  BT2ViewController.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/9/22.
//

import UIKit

class BT2ViewController: UIViewController {
    
    var slider = MySliderView()
    
    @IBOutlet weak var tfRate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        let widthView = view.frame.width
        slider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as! MySliderView
        slider.delegate = self
        
        slider.frame = CGRect(origin: CGPoint(x: widthView / 2 - 15, y: 50), size: CGSize(width: 60, height: 550))
        slider.backgroundColor = .clear
        view.addSubview(slider)
        tfRate.text = "0"
        tfRate.delegate = self
    }
}

protocol  SliderDelegate: class {
    func sliderDelegate(_ rate: String)
}

extension BT2ViewController: SliderDelegate {
    func sliderDelegate(_ rate: String) {
        tfRate.text = rate
    }
}

extension BT2ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            if let intValue = Int(text) {
                slider.reloadUI(rate: intValue)
            } else {
                slider.reloadUI(rate: 0)
            }
        }
        return true
    }
}

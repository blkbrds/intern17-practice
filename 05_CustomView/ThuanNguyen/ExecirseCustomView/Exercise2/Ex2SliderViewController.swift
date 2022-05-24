//
//  Ex2SliderViewController.swift
//  ExecirseCustomView
//
//  Created by thuan.nguyen on 25/04/2022.
//

import UIKit

class Ex2SliderViewController: UIViewController {
    
    var sliderView = MySliderView()
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        sliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as! MySliderView
        sliderView.frame = CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        sliderView.backgroundColor = .white
        sliderView.delegate = self
        textField.textColor = .red
        textField.layer.borderWidth = 1
        view.addSubview(sliderView)
    }
}

extension Ex2SliderViewController: MysliderViewDelegate {
    func sliderView(view: MySliderView, needsPerform action: MySliderView.Action) {
        switch action {
        case .changeValueSlider(value: let value):
                   textField.text = "\(value)"
        }
    }
}



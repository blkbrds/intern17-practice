//
//  SliderViewController.swift
//  CustomView
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/20/22.
//

import UIKit
protocol MySliderViewDataSource: AnyObject {
    func transferValueTextField() -> Int
}

final class SliderViewController: UIViewController {
    
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var valueTextField: UITextField!
    
    let myViewSlider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.text = "50"
        guard let myView = myViewSlider else { return }
        myView.frame = CGRect(x: 150, y: 160, width: 130, height: 520)
        view.addSubview(myView)
        myView.delegate = self
        myView.dataSource = self
        valueTextField.delegate = self
        valueTextField.returnKeyType = .done
    }
}

extension SliderViewController: MySliderViewDelegate {
    func moveSlider(view: MySliderView, value: Int) {
        valueTextField.text = "\(value)"
    }
}

extension SliderViewController: MySliderViewDataSource {
    func transferValueTextField() -> Int {
        let value = Int(valueTextField.text ?? "50") ?? 50
        return (value < 0 || value > 100) ? 50 : value
    }
}

extension SliderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let myView = myViewSlider else { return false}
        myView.getData()
        view.endEditing(true)
        return true
    }
}



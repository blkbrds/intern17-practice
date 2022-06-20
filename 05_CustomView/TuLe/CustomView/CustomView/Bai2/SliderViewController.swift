//
//  SliderViewController.swift
//  BaiTap2
//
//  Created by tu.le2 on 16/06/2022.
//

import UIKit

protocol MySliderViewDataSource: AnyObject {
    func getvalueTextField() -> Int
}

final class SliderViewController: UIViewController {
    @IBOutlet private weak var valueSliderTextField: UITextField!
    let sliderView = Bundle.main.loadNibNamed("MySliderView", owner: SliderViewController.self, options: nil)?.first as? MySliderView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        valueSliderTextField.delegate = self
        valueSliderTextField.returnKeyType = .done
    }
    
    private func configUI() {
        sliderView?.frame = CGRect(x: view.bounds.midX, y: 200, width: 106, height: 564)
        sliderView?.delegate = self
        sliderView?.dataSource = self
        view.addSubview(sliderView!)
    }
}
extension SliderViewController: MySliderViewDelegate {
    func valueNow(view: MySliderView, value: Int) {
        valueSliderTextField.text = "\(value)"
    }
}
extension SliderViewController: MySliderViewDataSource {
    func getvalueTextField() -> Int {
        return Int(valueSliderTextField.text ?? "50") ?? 50
    }
}

extension SliderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sliderView?.getData()
        view.endEditing(true)
        return true
    }
}

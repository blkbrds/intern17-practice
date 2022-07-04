//
//  MySliderViewController.swift
//  CustomView_bai1
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/17/22.
//

import UIKit

final class MySliderViewController: UIViewController {
    
    @IBOutlet private weak var valueTextField: UITextField!
    
    private var mySliderView: MySliderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        mySliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView
        let frame = CGRect(x: 170, y: 250, width: 48, height: 451)
        mySliderView?.frame = frame
        mySliderView?.delegate = self
        self.view.addSubview(mySliderView!)
    }
}

extension MySliderViewController: MySliderDelegate {
    func selected(mySliderView: MySliderView, value: Int) {
        valueTextField.text = String(value)
    }
}

extension MySliderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let value = Int(valueTextField.text ?? "") else { return false }
        if value > 100 || value < 0 {
            print("nhap sai")
        } else {
            mySliderView?.number = value
        }
        return true
    }
}

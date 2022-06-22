//
//  DatePickerViewController.swift
//  CustomView
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/21/22.
//

import UIKit

final class DatePickerViewController: UIViewController {
    
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var dateTextField: UITextField!
    var myDatePicker: MyDatePickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDatePicker = UINib(nibName: "MyDatePickerView", bundle: .main).instantiate(withOwner: self).first as? MyDatePickerView
        myDatePicker.frame = UIScreen.main.bounds
        self.view.addSubview(myDatePicker)
        dateTextField.delegate = self
        myDatePicker.delegate = self
    }
}

extension DatePickerViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let picker = myDatePicker { picker.show() }
        return false
    }
}

extension DatePickerViewController: MyDatePickerViewDelegate {
    func myDatePickerView(_ fxPickerView: MyDatePickerView, didSelectedWith date: String) {
        dateTextField.text = date
    } 
}

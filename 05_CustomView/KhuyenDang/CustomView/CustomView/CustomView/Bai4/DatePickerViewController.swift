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

    weak var myDatePickerView: MyDatePickerView?

    override func viewDidLoad() {
        super.viewDidLoad()
        myDatePickerView = UINib(nibName: "MyDatePickerView", bundle: .main).instantiate(withOwner: self).first as? MyDatePickerView
        guard let myDatePicker = myDatePickerView else { return }
        myDatePicker.frame = UIScreen.main.bounds
        view.addSubview(myDatePicker)
        dateTextField.delegate = self
        myDatePicker.delegate = self
    }
}

extension DatePickerViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let picker = myDatePickerView else { return true}
        picker.show()
        return false
    }
}

extension DatePickerViewController: MyDatePickerViewDelegate {
    func myDatePickerView(_ fxPickerView: MyDatePickerView, didSelectedWith date: String) {
        dateTextField.text = date
    } 
}

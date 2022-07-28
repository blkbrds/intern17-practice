//
//  DatePickerView.swift
//  Test
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/20/22.
//

import UIKit

// MARK: - Protocol
protocol DatePickerDelegate:class {
    func getDate(datePickerView: DatePickerView, date:String)
}

final class DatePickerView: UIView {
    
    // MARK: - Define
    let datePicker: UIDatePicker = UIDatePicker()
    var dateFormate = "dd/MM/yyyy"
    var delegate: DatePickerDelegate?
    
    // MARK: - Function
    func showDatePicker(datePickerTextField: UITextField){
        //Formate Date
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        toolbar.setItems([doneButton], animated: false)
        datePickerTextField.inputAccessoryView = toolbar
        datePickerTextField.inputView = datePicker    }
    
    // MARK: - Objc
    @objc private func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormate
        let date = formatter.string(from: datePicker.date)
        delegate?.getDate(datePickerView: self, date: date)
    }
}

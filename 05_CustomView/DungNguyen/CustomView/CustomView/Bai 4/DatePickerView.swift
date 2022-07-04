//
//  DatePickerView.swift
//  CustomView_bai1
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/21/22.
//

import UIKit

protocol DatePickerDelegate:class {
    func getDate(datePickerView: DatePickerView, date:String)
}

final class DatePickerView: UIView {

    let datePicker: UIDatePicker = UIDatePicker()
    var dateFormate = "MMM dd, yyyy"
    var delegate: DatePickerDelegate?
    
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
        datePickerTextField.inputView = datePicker
    }
        
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormate
        let date = formatter.string(from: datePicker.date)
        delegate?.getDate(datePickerView: self, date: date)
    }
}

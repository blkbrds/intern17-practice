//
//  DatePickerView.swift
//  ExecirseCustomView
//
//  Created by thuan.nguyen on 27/04/2022.
//

import UIKit
import Foundation
protocol DatePickerViewDelegate: class {
    func view(_ view: DatePickerView, needsPerform action: DatePickerView.Action)
}

final class DatePickerView: UIView {
    let datePicker = UIDatePicker()
    weak var delegate: DatePickerViewDelegate?
    
    func showDatePicker(txtDateField: UITextField) {
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        //style picker
        datePicker.preferredDatePickerStyle = .wheels
        
        //done Button & Cancel Button
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDatePicker))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        txtDateField.inputAccessoryView = toolbar
        txtDateField.inputView = datePicker
        
    }
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let date = formatter.string(from: datePicker.date)
        self.delegate?.view(self, needsPerform: .select(date: date))
    }
    
}
extension DatePickerView {
    enum Action {
        case select(date: String)
    }
}

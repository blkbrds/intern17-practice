//
//  DatePickerView.swift
//  CustomView
//
//  Created by tri.nguyen on 12/04/2022.
//

import Foundation
import UIKit

// MARK: - Protocol
protocol DatePickerViewDelegate: class {
    func getDate(_ view: DatePickerView, date: String)
}

final class DatePickerView: UIView {
    
    // MARK: - Properties
    private let datePicker: UIDatePicker = UIDatePicker()
    private let dateFormatte: String = "MMM dd, yyyy"
    weak var delegate: DatePickerViewDelegate?
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    func showDatePicker(datePickerTextField: UITextField) {
        // Format Date
        datePicker.datePickerMode = .date

        // Style Picker
        datePicker.preferredDatePickerStyle = .wheels
        
        // Toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDatePicker))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        // Assign toolbar
        datePickerTextField.inputAccessoryView = toolBar
        datePickerTextField.inputView = datePicker
    }
    
    @objc func doneDatePicker() {
        // Formatter
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatte
        formatter.dateStyle = .full
        formatter.timeStyle = .none
            
        let date = formatter.string(from: datePicker.date)
        self.delegate?.getDate(self, date: date)
    }
}



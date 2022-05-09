//
//  DatePickerView.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import UIKit

// MARK: - Protocol
protocol DatePickerViewDelegate: class {
    func view(_ view: DatePickerView, needsPerform action: DatePickerView.Action)
}

final class DatePickerView: UIView {
    
    // MARK: - Properties
    private let datePicker: UIDatePicker = UIDatePicker()
    private let dateFormatter: String = "MMM dd, yyyy"
    weak var delegate: DatePickerViewDelegate?
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    func configDatePicker(datePickerTextField: UITextField) {
        // Format Date
        datePicker.datePickerMode = .date
        
        // Style Picker
        datePicker.preferredDatePickerStyle = .wheels
        
        // Toolbar
        let toobar = UIToolbar()
        toobar.sizeToFit()
        
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        toobar.setItems([doneBarButtonItem], animated: true)
        toobar.isUserInteractionEnabled = true
        
        // Assign toolbar
        datePickerTextField.inputAccessoryView = toobar
        datePickerTextField.inputView = datePicker
    }
    
    // MARK: - Objc
    @objc private func doneDatePicker() {
        // Formatter
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatter
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        
        let date = formatter.string(from: datePicker.date)
        delegate?.view(self, needsPerform: .select(date: date))
    }
}

// MARK: - Extention DatePickerView
extension DatePickerView {
    // MARK: - Define
    enum Action {
        case select(date: String)
    }
}

//
//  DatePickerView.swift
//  CustomView
//
//  Created by luong.tran on 25/08/2022.
//

import UIKit

protocol DatePickerViewDelegate{
    
    func updateDatePicker(view: DatePickerView, data: String)
    
}

class DatePickerView: UIView {

    @IBOutlet private weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerViewDelegate?
    let datePiker = UIDatePicker()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        showDatePicker()
    }
    
    private func showDatePicker() {
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        toolBar.isUserInteractionEnabled = true
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDate))
        toolBar.setItems([doneButton], animated: false)
        self.addSubview(toolBar)
    }

    @objc private func doneDate() {
        guard let delegate = delegate else {
            return
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateString = formatter.string(from: datePicker.date)
        delegate.updateDatePicker(view: self, data: dateString)
    }
    
}

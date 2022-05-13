//
//  CustomDatePickerView.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/12/22.
//

import Foundation
import UIKit

final class CustomDatePickerView: UIView {
    var date = Date()
    var delegate: CustomDatePickerViewDelegate?
    enum Action {
        case dateChanged(date: Date)
    }
    
    @IBOutlet weak var dateToolbar: UIToolbar!
    @IBOutlet weak var customDatePicker: UIDatePicker!
    @IBOutlet weak var doneButtonToolbar: UIBarButtonItem!

    @IBAction func valueChangedDatePicker(_ sender: UIDatePicker) {
        date = sender.date
    }
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        self.alpha = 0
        self.isHidden = true
        CustomDatePickerView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
        delegate?.view(self, needsPerform: .dateChanged(date: date))
    }
}

protocol CustomDatePickerViewDelegate {
    func view(_ view: CustomDatePickerView, needsPerform action: CustomDatePickerView.Action)
}



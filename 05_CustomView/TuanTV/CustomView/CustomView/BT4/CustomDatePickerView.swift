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
    weak var delegate: CustomDatePickerViewDelegate?
    enum Action {
        case dateChanged(date: Date)
    }
    // Outlet
    @IBOutlet private weak var dateToolbar: UIToolbar!
    @IBOutlet private weak var customDatePicker: UIDatePicker!
    @IBOutlet private weak var doneButtonToolbar: UIBarButtonItem!
    // Action
    @IBAction private func valueChangedDatePicker(_ sender: UIDatePicker) {
        date = sender.date
    }
    @IBAction private func doneTapped(_ sender: UIBarButtonItem) {
        self.alpha = 0
        self.isHidden = true
        CustomDatePickerView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
        guard let delegate = delegate else { return }
        delegate.view(self, needsPerform: .dateChanged(date: date))
    }
}

protocol CustomDatePickerViewDelegate: class {
    func view(_ view: CustomDatePickerView, needsPerform action: CustomDatePickerView.Action)
}



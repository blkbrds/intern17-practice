//
//  MyDatePickerView.swift
//  CustomView
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/21/22.
//

import UIKit
protocol MyDatePickerViewDelegate: AnyObject {
    func myDatePickerView(_ myDatePickerView: MyDatePickerView, didSelectedWith date: String)
}

final class MyDatePickerView: UIView {
    
    @IBOutlet private weak var markView: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var datePicker: UIDatePicker!
    
    weak var delegate: MyDatePickerViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        markView.alpha = 0
        self.isHidden = true
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            if touch.view == markView {
                hide()
            }
        }
    }
    
    func show() {
        self.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.markView.alpha = 0.3
        }
    }
    
    private func hide() {
        UIView.animate(withDuration: 0.3) {
            self.markView.alpha = 0.0
        } completion: { _ in
            self.isHidden = true
        }
    }
    
    @IBAction private func cancelButton(_ sender: Any) {
        hide()
    }
    
    @IBAction private func doneButton(_ sender: Any) {
        let format = DateFormatter()
        format.dateFormat = "MMM dd, yyyy"
        let date = format.string(from: datePicker.date)
        if let delegate = delegate {
            delegate.myDatePickerView(self, didSelectedWith: date )
        }
        hide()
    }
}

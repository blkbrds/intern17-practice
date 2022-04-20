//
//  DatePickerCustomView.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/5/22.
//

import UIKit

protocol DataPickerViewDelegate {
    func sendDate(in view: DatePickerCustomView, mydate: Date, isHide: Bool)
}

final class DatePickerCustomView: UIView {

    //MARK: - IBOutlet private variable
    @IBOutlet private weak var datePickerView: UIDatePicker!
    
    //MARK: - Variables
    var delegate: DataPickerViewDelegate?
    
    override func layoutSubviews() {
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        self.backgroundColor = .systemGray6
    }
    
    //MARK: - IBaction private function
    @IBAction private func didTouchDoneButton(_ sender: UIButton) {
        guard let selectedDate = datePickerView?.date else { return }
        delegate?.sendDate(in: self, mydate: selectedDate, isHide: true)
    }
}

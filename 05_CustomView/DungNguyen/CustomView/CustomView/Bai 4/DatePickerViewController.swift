//
//  DatePickerViewController.swift
//  CustomView_bai1
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/21/22.
//

import UIKit

class DatePickerViewController: UIViewController {

    
    @IBOutlet weak var datePickerTextField: UITextField!
    
    private var datePicker: DatePickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = DatePickerView()
        datePicker?.delegate = self
        datePicker?.showDatePicker(datePickerTextField: datePickerTextField)
    }
}

extension DatePickerViewController : DatePickerDelegate{
    func getDate(datePickerView: DatePickerView, date: String) {
        datePickerTextField.text = date
        self.view.endEditing(true)
    }
}

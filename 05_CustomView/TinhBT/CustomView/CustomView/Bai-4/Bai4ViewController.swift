//
//  Bai4ViewController.swift
//  CustomView
//
//  Created by Tinh Bui T. VN.Danang on 4/26/22.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var dayTextField: UITextField!
    
    // MARK: - property
    let datePicker = UIDatePicker()
    
    // MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        creteDatepicker()
    }
    
    // MARK:- Private function
    private func createToolbar() -> UIToolbar {
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    private func creteDatepicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dayTextField.textAlignment = .center
        dayTextField.inputView = datePicker
        dayTextField.inputAccessoryView = createToolbar()
    }
    
    @objc private func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dayTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

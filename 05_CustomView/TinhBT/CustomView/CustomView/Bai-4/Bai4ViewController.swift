//
//  Bai4ViewController.swift
//  CustomView
//
//  Created by Tinh Bui T. VN.Danang on 4/26/22.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var dayTextField: UITextField!
    
    // MARK: - Properties
    let datePicker = UIDatePicker()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        creteDatepicker()
    }
    
    // MARK: - Private functions
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
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
    
    // MARK: - Objc functions
    @objc private func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dayTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

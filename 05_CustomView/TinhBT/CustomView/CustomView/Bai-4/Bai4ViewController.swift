//
//  Bai4ViewController.swift
//  CustomView
//
//  Created by Tinh Bui T. VN.Danang on 4/26/22.
//

import UIKit

class Bai4ViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creteDatepicker()
    }
    
    func createToolbar() -> UIToolbar {
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func creteDatepicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        dayTextField.textAlignment = .center
        dayTextField.inputView = datePicker
        dayTextField.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dayTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

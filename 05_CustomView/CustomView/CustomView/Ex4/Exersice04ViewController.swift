//
//  Exersice04ViewController.swift
//  CustomView
//
//  Created by tri.nguyen on 04/04/2022.
//

import UIKit

final class Exersice04ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var dateTextField: UITextField!
    
    // MARK: - Properties
    let datePickerView = DatePickerView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Function
    func setupUI() {
        title = "Exercise04"
        dateTextField.delegate = self
        datePickerView.delegate = datePickerView
        datePickerView.dataSource = datePickerView
    }
}

// MARK: - Extention UITextFieldDelegate
extension Exersice04ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePickerView.selectRow(datePickerView.selectDate(), inComponent: 0, animated: true)
        textField.inputView = datePickerView
        let toolBar = UIToolbar(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.frame.width, height: CGFloat(44))))
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDatePicker))
        
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        textField.inputAccessoryView = toolBar
        
        NotificationCenter.default.addObserver(self, selector: #selector(dateChanged(notification:)), name: .dateChanged, object: nil)
    }
    
    @objc func doneDatePicker() {
        dateTextField.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: .dateChanged, object: nil)
    }
    
    @objc func dateChanged(notification: Notification) {
        let userInfo = notification.userInfo
        if let date = userInfo?["date"] as? String {
            self.dateTextField.text = date
        }
    }
}

// MARK: Notification Observer
extension Notification.Name {
    static var dateChanged : Notification.Name {
        return .init("dateChanged")
    }
}

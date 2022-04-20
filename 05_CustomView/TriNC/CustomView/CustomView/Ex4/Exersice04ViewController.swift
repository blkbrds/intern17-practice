//
//  Exersice04ViewController.swift
//  CustomView
//
//  Created by tri.nguyen on 04/04/2022.
//

import UIKit

final class Exersice04ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var datePickerTextField: UITextField!
    
    // MARK: Properties
    private var datePickerView: DatePickerView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        title = "Exercise04"
        datePickerView = DatePickerView(frame: CGRect(x: 0, y: view.bounds.height - 400, width: view.bounds.width, height: 400))
        datePickerView.delegate = self
        datePickerView.showDatePicker(datePickerTextField: datePickerTextField)
        view.addSubview(datePickerView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.3) {
            self.view.endEditing(true)
        }
    }
}


// MARK: - Extention
extension Exersice04ViewController: DatePickerViewDelegate {
    func view(_ view: DatePickerView, needsPerform action: DatePickerView.Action) {
        switch action {
        case .select(let action):
            UIView.animate(withDuration: 0.3) {
                self.view.endEditing(true)
            } completion: { _ in
                self.datePickerTextField.text = action
            }
        }
    }
}





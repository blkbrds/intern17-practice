//
//  Ex4DateViewController.swift
//  ExecirseCustomView
//
//  Created by thuan.nguyen on 27/04/2022.
//

import UIKit

class Ex4DateViewController: UIViewController {

    @IBOutlet weak var txtDatePicker: UITextField!
    private var datePickerView: DatePickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    private func setUI() {
        datePickerView = DatePickerView(frame: CGRect(x: 0, y: view.bounds.height - 400, width: view.bounds.width, height: 400))
        datePickerView.delegate = self
        datePickerView.showDatePicker(txtDateField: txtDatePicker)
        view.addSubview(datePickerView)
    }
}
extension Ex4DateViewController: DatePickerViewDelegate {
    func view(_ view: DatePickerView, needsPerform action: DatePickerView.Action) {
        switch action {
        case .select(let action):
            UIView.animate(withDuration: 0.3) {
                self.view.endEditing(true)
            } completion: { _ in
                self.txtDatePicker.text = action
            }
        }
    }
}

    



//
//  BT4ViewController.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/12/22.
//

import UIKit

final class BT4ViewController: UIViewController {
    @IBOutlet weak var dateTextField: UITextField!
    var customDatePicker = CustomDatePickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let heightView = UIScreen.main.bounds.size.height
        let heightCustomDatePickerView: CGFloat = 344
        let widthCustomDatePickerView: CGFloat = 400
        
        customDatePicker = Bundle.main.loadNibNamed("CustomDatePickerView", owner: self, options: nil)?[0] as! CustomDatePickerView
        customDatePicker.frame = CGRect(x: 0, y: heightView - heightCustomDatePickerView, width: widthCustomDatePickerView, height: heightCustomDatePickerView)
        customDatePicker.backgroundColor = .red
        view.addSubview(customDatePicker)
        customDatePicker.delegate = self
        dateTextField.addTarget(self, action: #selector(showCustomDatePickerView), for: .touchDown)
    }
    
    @objc func showCustomDatePickerView() {
        customDatePicker.alpha = 0
        customDatePicker.isHidden = false
        CustomDatePickerView.animate(withDuration: 0.3) {
            self.customDatePicker.alpha = 1
        }
    }
}

extension BT4ViewController: CustomDatePickerViewDelegate {
    func view(_ view: CustomDatePickerView, needsPerform action: CustomDatePickerView.Action) {
        switch action {
        case .dateChanged(date: let date):
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM dd,yyyy"
            let dateString = dateFormatter.string(from: date)
            dateTextField.text = dateString
        }
    }
}





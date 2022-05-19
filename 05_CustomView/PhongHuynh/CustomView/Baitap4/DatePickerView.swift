import UIKit

// MARK: - DatePickerViewDelegate
protocol DatePickerViewDelegate: class {
    
    func controller(view: DatePickerView, date: String)
}

class DatePickerView: UIView {
    
    // MARK: - Properties
    let datePicker: UIDatePicker = UIDatePicker()
    let dateFormatte: String = "mm dd, yyyy"
    
    weak var delegate: DatePickerViewDelegate?
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showDatePicker(datePickerTextField: UITextField) {
        let toolBar = UIToolbar()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        toolBar.sizeToFit()
        datePickerTextField.inputAccessoryView = toolBar
        datePickerTextField.inputView = datePicker
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDatePicker))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
    }
    
    // MARK: - Objc functions
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatte
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        let date = formatter.string(from: datePicker.date)
        if let delegate = delegate {
            delegate.controller(view: self, date: date)
        }
    }
}

import UIKit

// MARK: - DatePickerViewDelegate
protocol DatePickerViewDelegate: class {
    
    func controller(_ controller: DatePickerView, needsPerfom actions: DatePickerView.Action)
}

final class DatePickerView: UIView {
    
    // MARK: - Define
    enum Action {
        case update(date: String)
    }
    
    // MARK: - Properties
    private let datePicker: UIDatePicker = UIDatePicker()
    private let dateFormatte: String = "dd/MM/yyyy"
    
    // MARK: - Properties
    weak var delegate: DatePickerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funtions
    func configDatePicker(datePickerTextField: UITextField) {
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
    @objc private func doneDatePicker() {
        let format = DateFormatter()
        format.dateFormat = dateFormatte
        let date = format.string(from: datePicker.date)
        if let delegate = delegate {
            delegate.controller(self, needsPerfom: .update(date: date))
        }
    }
}

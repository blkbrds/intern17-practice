import UIKit

protocol DatePickerDelegate: AnyObject {
    func didTap(view: DatePickerView, dateFormat: String)
}

final class DatePickerView : UIView{
    let datePicker = UIDatePicker()
    weak var delegate: DatePickerDelegate?
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    
    @objc private func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        delegate?.didTap(view: self, dateFormat: dateFormatter.string(from: datePicker.date))
    }
}

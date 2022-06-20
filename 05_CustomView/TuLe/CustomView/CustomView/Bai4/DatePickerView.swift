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
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    @objc private func donePressed() {
        guard let delegate = delegate else {
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        delegate.didTap(view: self, dateFormat: dateFormatter.string(from: datePicker.date))
    }
}

import UIKit

protocol DatePickerDelegate: AnyObject {
    func didTap(view: DatePicker, dateFormat: String)
}

final class DatePicker : UIView{
    let datePicker = UIDatePicker()
    var delegate: DatePickerDelegate?
    
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

import UIKit
final class DatePickerViewController: UIViewController {
    @IBOutlet private weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    private func configUI() {
        let dateView = DatePicker()
        dateView.datePicker.preferredDatePickerStyle = .wheels
        dateTextField.inputAccessoryView = dateView.createToolbar()
        dateTextField.inputView = dateView.datePicker
        dateView.datePicker.datePickerMode = .date
        view.addSubview(dateView)
        dateView.delegate = self
    }
}
extension DatePickerViewController: DatePickerDelegate {
    func didTap(view: DatePicker, dateFormat: String) {
        self.view.endEditing(true)
        dateTextField.text = dateFormat
    }
}

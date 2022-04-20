import UIKit

final class Bai4ViewController: UIViewController, UIPickerViewDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var datePickerTextField: UITextField!
    
    // MARK: Properties
    var datePickerView = DatePickerView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerView = DatePickerView(frame: CGRect(x: 0, y: view.bounds.height , width: view.bounds.width, height: view.bounds.height))
        datePickerView.showDatePicker(datePickerTextField: datePickerTextField)
        view.addSubview(datePickerView)
        datePickerView.delegate = self
    }
}

// MARK: - DatePickerViewDelegate
extension Bai4ViewController: DatePickerViewDelegate {
    
    func controller(view: DatePickerView, date: String) {
        UIView.animate(withDuration: 0.8, delay: 0.3, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
            self.view.endEditing(true)
        }, completion: { _ in
            self.datePickerTextField.text = date
        })
    }
}

import UIKit

final class Bai4ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak private var dateTextField: UITextField!
    
    let datePicker = DatePickerView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.delegate = self
        datePicker.delegate = datePicker
        datePicker.dataSource = datePicker
    }
    // MARK: - Objc functions
    @objc func doneDatePicker(){
          dateTextField.endEditing(true)
      }
    // MARK: - Objc functions
    @objc func dateChanged(notification:Notification){
          let userInfo = notification.userInfo
          if let date = userInfo?["date"] as? String{
              self.dateTextField.text = date
          }
      }

}
// MARK: - UITextFieldDelegate
extension Bai4ViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
         datePicker.selectRow(datePicker.selectedDate(), inComponent: 0, animated: true)
         textField.inputView = datePicker
         let toolBar = UIToolbar(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.frame.width, height: CGFloat(44))))
         let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
         let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDatePicker))
         toolBar.setItems([space,doneButton], animated: false)
         toolBar.isUserInteractionEnabled = true
         toolBar.sizeToFit()
         textField.inputAccessoryView = toolBar
         NotificationCenter.default.addObserver(self, selector: #selector(dateChanged(notification:)), name:.dateChanged, object: nil)
     }
}

import UIKit

// MARK: - DetailViewControllerDelegate
protocol DetailViewControllerDelegate {
    
    func controller(view: DetailViewController, needsPerfom actions: DetailViewController.Action)
}

final class DetailViewController: UIViewController {
    
    // MARK: - Define
    enum Action {
        case update(User)
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    
    // MARK: Properties
    var datePickerView = DatePickerView()
    var viewModel: DetailViewModel?
    var delegate: DetailViewControllerDelegate?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail"
        nameTextField.text = viewModel?.user.name
        dateTextField.text = viewModel?.user.date
        updateDatePicker()
        boderButton()
        
    }
    
    // MARK: - Private functions
    private func updateDatePicker() {
        datePickerView = DatePickerView(frame: CGRect(x: 0, y: view.bounds.height , width: view.bounds.width, height: view.bounds.height))
        datePickerView.showDatePicker(datePickerTextField: dateTextField)
        view.addSubview(datePickerView)
        datePickerView.delegate = self
    }
    
    private func boderButton() {
        okButton.backgroundColor = .clear
        okButton.layer.cornerRadius = 10
        okButton.layer.borderWidth = 0.5
        nameTextField.layer.borderColor = UIColor.systemPink.cgColor
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.borderColor = UIColor.systemPink.cgColor
        dateTextField.layer.cornerRadius = 5
        dateTextField.layer.borderWidth = 0.5
        dateTextField.layer.borderColor = UIColor.systemPink.cgColor
        userImageView.layer.cornerRadius = 40
        userImageView.layer.borderWidth = 0.5
        userImageView.layer.borderColor = UIColor.systemPink.cgColor
    }
    
    private func leftAction() {
        if let delegate = delegate, let viewModel = viewModel, let name = nameTextField.text, let date = dateTextField.text {
            viewModel.user.name = name
            viewModel.user.date = date
            delegate.controller(view: self, needsPerfom: .update(viewModel.user))
        }
        navigationController?.popViewController(animated: true)
    }

    // MARK: - IBActions
    @IBAction private func okButton(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Do you want to exit this user with name and birthday" , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {action in
            self.leftAction()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - DatePickerViewDelegate
extension DetailViewController: DatePickerViewDelegate {
    
    func controller(view: DatePickerView, date: String) {
        UIView.animate(withDuration: 0.8, delay: 0.3, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
            self.view.endEditing(true)
        }, completion: { _ in
            self.dateTextField.text = date
        })
    }
}

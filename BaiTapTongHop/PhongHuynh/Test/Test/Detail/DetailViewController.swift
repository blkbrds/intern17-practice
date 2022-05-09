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
    @IBOutlet private weak var okButton: UIButton!
    
    // MARK: Properties
    var datePickerView = DatePickerView()
    var viewModel: DetailViewModel?
    var delegate: DetailViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail"
        updateDatePicker()
        boderButton()
    }
    
    // MARK: - Private functions
    private func updateDatePicker() {
        guard let viewModel = viewModel else { return }
        datePickerView = DatePickerView(frame: CGRect(x: 0, y: view.bounds.height , width: view.bounds.width, height: view.bounds.height))
        datePickerView.showDatePicker(datePickerTextField: dateTextField)
        view.addSubview(datePickerView)
        datePickerView.delegate = self
        nameTextField.text = viewModel.user.name
        dateTextField.text = viewModel.user.date
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
        guard let viewModel = viewModel else { return }
        let alert = UIAlertController(title: "Warning", message: "Do you want to exit this user with name \"\(viewModel.user.name)\" and birthday \"\(viewModel.user.date)\"", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {action in
            self.leftAction()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - DatePickerViewDelegate
extension DetailViewController: DatePickerViewDelegate {
    func controller(view: DatePickerView, needsPerfom actions: DatePickerView.Action) {
        switch actions {
        case .update(let date):
            UIView.animate(withDuration: 0.8, delay: 0.3, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
                self.view.endEditing(true)
            }, completion: { _ in
                self.dateTextField.text = date
            })
        }
    }
}

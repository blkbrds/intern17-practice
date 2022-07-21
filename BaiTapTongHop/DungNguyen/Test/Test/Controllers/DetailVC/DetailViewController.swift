//
//  DetailViewController.swift
//  Test
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/20/22.
//

import UIKit

// MARK: - Protocol
protocol DetailViewControllerDelegate: AnyObject {
    func controller(_ controller: DetailViewController, needPerformAction action: DetailViewController.Action)
}

final class DetailViewController: BaseViewController {
    
    // MARK: - Define
    enum Action {
        case updateUser(user: User)
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var avaterImage: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var birthdayTextField: UITextField!
    @IBOutlet private weak var okButton: UIButton!
    
    // MARK: - Properties
    var viewModel: DetailViewModel?
    weak var delegate: DetailViewControllerDelegate?
    private var datePicker: DatePickerView?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI(){
        title = "Detail"
        nameTextField.text = viewModel?.user.name
        birthdayTextField.text = viewModel?.user.birthday
        avaterImage.image = UIImage(named: viewModel?.user.avatar ?? "")
        datePicker = DatePickerView()
        datePicker?.delegate = self
        datePicker?.showDatePicker(datePickerTextField: birthdayTextField)
        avaterImage.layer.cornerRadius = 75
        avaterImage.layer.borderWidth = 0.5
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.masksToBounds = true
        birthdayTextField.layer.cornerRadius = 10
        birthdayTextField.layer.borderWidth = 0.5
        birthdayTextField.layer.masksToBounds = true
        okButton.layer.cornerRadius = 20
        okButton.layer.borderWidth = 0.5
        nameTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        birthdayTextField.resignFirstResponder()
    }
    
    // MARK: - Private functions
    private func updateUser() {
        guard let viewModel = viewModel else { return }
        viewModel.user.name = nameTextField.text
        viewModel.user.birthday = birthdayTextField.text
        delegate?.controller(self, needPerformAction: .updateUser(user: viewModel.user))
        navigationController?.popViewController(animated: true)
    }
    
    private func showAlert() {
        guard let name = nameTextField.text, let birthday = birthdayTextField.text else { return }
        let alert = UIAlertController(title: "Warning", message: "Do you want to edit this with name \(name) and birthday \(birthday)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (_) in
            self.updateUser()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - IBActions
    @IBAction private func updateUserButtonTouchUpInside(_ sender: UIButton) {
        showAlert()
    }
}

// MARK: - Extensions
extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            birthdayTextField.becomeFirstResponder()
        }
        return true
    }
}

extension DetailViewController: DatePickerDelegate {
    func getDate(datePickerView: DatePickerView, date: String) {
        birthdayTextField.text = date
        self.view.endEditing(true)
    }
}

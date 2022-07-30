//
//  DetailViewController.swift
//  Test
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/20/22.
//

import UIKit

// MARK: - Protocol
protocol DetailViewControllerDelegate: AnyObject {
    func controller(_ controller: DetailViewController, neesPerformAction action: DetailViewController.Action )
}

final class DetailViewController: UIViewController {
    
    // MARK: - Enum
    enum Action {
        case updatedUser(user: User)
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var birthdayTextField: UITextField!
    @IBOutlet private weak var okButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: DetailViewControllerDelegate?
    var viewModel: DetailViewModel?
    private let datePicker = UIDatePicker()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUIDetail()
        updateView()
    }
    
    // MARK: - ConfigUI
    override func viewDidLayoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
        avatarImageView.clipsToBounds = true
        okButton.layer.cornerRadius = 10
        okButton.layer.borderWidth = 0.5
        okButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func configUIDetail() {
        title = "Detail"
        nameTextField.returnKeyType = .next
        birthdayTextField.returnKeyType = .done
        nameTextField.delegate = self
        birthdayTextField.delegate = self
    }
    
    // MARK: - Private methods
    private func updateView() {
        guard let viewModel = viewModel else { return }
        avatarImageView.image = UIImage(named: viewModel.user.avatarImage)
        nameTextField.text = viewModel.user.name
        birthdayTextField.text = viewModel.user.birthday
    }
    
    private func showAlert() {
        guard let name = nameTextField.text, let birthday = birthdayTextField.text else { return }
        let alert = UIAlertController(title: "Warning", message: "Do you want to edit this user with name \(name) and birthday \(birthday)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: {(_) in self.updatedUser()}))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        birthdayTextField.inputAccessoryView = toolbar
        birthdayTextField.inputView = datePicker
    }
    
    private func updatedUser() {
        guard let viewModel = viewModel else {
            return
        }
        viewModel.user.name = nameTextField.text ?? ""
        viewModel.user.birthday = birthdayTextField.text ?? ""
        delegate?.controller(self, neesPerformAction: .updatedUser(user: viewModel.user))
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Override func
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        nameTextField.resignFirstResponder()
        birthdayTextField.resignFirstResponder()
    }
    
    // MARK: - IBAction
    @IBAction func updateUserButtonTouchUpInside(_ sender: Any) {
        showAlert()
    }

    // MARK: - Objc func
    @objc private func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        birthdayTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc private func cancelDatePicker(){
        self.view.endEditing(true)
    }
}

// MARK: UITextFieldDelegate
extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            birthdayTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == birthdayTextField {
            showDatePicker()
        }
        return true
    }
}

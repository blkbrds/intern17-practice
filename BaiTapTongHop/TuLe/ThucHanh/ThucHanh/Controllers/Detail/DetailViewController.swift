//
//  DetailViewController.swift
//  ThucHanh
//
//  Created by tu.le2 on 20/07/2022.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func view(view: DetailViewController, needPerform action: DetailViewController.Action)
}

final class DetailViewController: UIViewController {
    enum Action {
        case doneButtonPressed(user: HomeTableCellViewModel)
    }
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var birthdayTextField: UITextField!
    @IBOutlet private weak var userImage: UIImageView!
    
    var viewModel: DetailViewModel?
    let datePicker = UIDatePicker()
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        createDatePicker()
    }
    
    private func configUI() {
        title = "Detail"
        guard let viewModel = viewModel else {
            return
        }
        userImage.layer.cornerRadius = userImage.frame.width/2
        nameTextField?.text = viewModel.user.name
        birthdayTextField?.text = viewModel.user.birthday
    }
    
    private func createDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
        birthdayTextField.inputAccessoryView = toolBar
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        birthdayTextField.inputView = datePicker
    }
    
    @IBAction private func screenTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @objc private func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthdayTextField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @IBAction private func okButtonTouchUpInside(_ sender: Any) {
        guard let nameTextField = nameTextField.text,
              let birthdayTextField = birthdayTextField.text  else {
            return
        }
        
        let dialogMessage = UIAlertController(title: "Confirm", message: "Do you want to edit this user with name \(nameTextField) and birthday \(birthdayTextField)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            self.delegate?.view(view: self, needPerform: .doneButtonPressed(user: self.viewModelForDetail()))
            self.navigationController?.popToRootViewController(animated: true)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func viewModelForDetail() -> HomeTableCellViewModel {
        return HomeTableCellViewModel(user: UserModel(name: nameTextField.text ?? "", birthday: birthdayTextField.text ?? ""))
    }
}

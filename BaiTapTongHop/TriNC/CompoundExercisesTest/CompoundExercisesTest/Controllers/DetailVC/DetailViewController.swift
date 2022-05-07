//
//  DetailViewController.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import UIKit


final class DetailViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var dateOfBirthTextField: UITextField!
    @IBOutlet private weak var notificationButton: UIButton!
    
    // MARK: - Properties
    private var datePickerView = DatePickerView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI
    override func setupUI() {
        title = "Detail"
        
        // Image
        thumbnailImageView.layer.cornerRadius = 48
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.layer.borderColor = UIColor.black.cgColor
        thumbnailImageView.layer.borderWidth = 1.5
        
        // TextField
        nameTextField.layer.cornerRadius = 12
        nameTextField.clipsToBounds = true
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.layer.borderWidth = 1.0
    
        dateOfBirthTextField.layer.cornerRadius = 12
        dateOfBirthTextField.clipsToBounds = true
        dateOfBirthTextField.layer.borderColor = UIColor.black.cgColor
        dateOfBirthTextField.layer.borderWidth = 1.0
    
        // Button
        notificationButton.layer.cornerRadius = 12
        notificationButton.clipsToBounds = true
        notificationButton.layer.borderColor = UIColor.lightGray.cgColor
        notificationButton.layer.borderWidth = 1.0
    }
    
    // MARK: - Data
    override func setupData() {
        updatePicker()
    }
    
    // MARK: - Private Function
    private func updatePicker() {
        datePickerView = DatePickerView(frame: CGRect(x: 0, y: view.bounds.height - 400, width: view.bounds.width, height: 400))
        datePickerView.delegate = self
        datePickerView.showDatePicker(datePickerTextField: dateOfBirthTextField)
        view.addSubview(datePickerView)
    }
    
    // MARK: - Todo:
    private func handleData() {}
    
    // MARK: - IBAction
    @IBAction private func notificationButtonTouchUpInside(_ sender: Any) {
        let alertVC = UIAlertController(title: "Warning", message: "Do you want to edit this user with name and birthday", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        navigationController?.popViewController(animated: true)
        present(alertVC, animated: true)
    }
}

// MARK: - Implement Protocol
extension DetailViewController: DatePickerViewDelegate {
    func view(_ view: DatePickerView, needsPerform action: DatePickerView.Action) {
        switch action {
        case .select(date: let action):
            UIView.animate(withDuration: 0.1) {
                self.view.endEditing(true)
            } completion: { _ in
                self.dateOfBirthTextField.text = action
            }
        }
    }
}

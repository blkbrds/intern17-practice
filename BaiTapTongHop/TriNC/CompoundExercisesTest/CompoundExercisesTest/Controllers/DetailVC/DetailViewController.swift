//
//  DetailViewController.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import UIKit

// MARK: - Protocol
protocol DetailViewControllerDelegate: class {
    func controller(view: DetailViewController, needsPerform action: DetailViewController.Action)
}

final class DetailViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var dateOfBirthTextField: UITextField!
    @IBOutlet private weak var doneButton: UIButton!

    // MARK: - Enum
    enum Action {
        case update(User)
    }
    
    // MARK: - Properties
    weak var delegate: DetailViewControllerDelegate?
    private var datePickerView = DatePickerView()
    var date: Date? // Save
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI
    override func setupUI() {
        title = "Profile Girl"
        
        // Image
        thumbnailImageView.layer.cornerRadius = 48
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.layer.borderColor = UIColor.orange.cgColor
        thumbnailImageView.layer.borderWidth = 1
        
        // TextField
        nameTextField.layer.cornerRadius = 12
        nameTextField.clipsToBounds = true
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.borderWidth = 0.8
        
        dateOfBirthTextField.layer.cornerRadius = 12
        dateOfBirthTextField.clipsToBounds = true
        dateOfBirthTextField.layer.borderColor = UIColor.lightGray.cgColor
        dateOfBirthTextField.layer.borderWidth = 0.8
        
        // Button
        doneButton.layer.cornerRadius = 12
        doneButton.clipsToBounds = true
        doneButton.layer.borderColor = UIColor.lightGray.cgColor
        doneButton.layer.borderWidth = 0.8
    }
    
    // MARK: - Data
    override func setupData() {
        updatePicker()
        
        // singleton
        PhotoManager.shared.fetchImage(completion: { [weak self] image in
            if let image = image {
                self?.thumbnailImageView.image = image
            }
        })
    }
    
    // MARK: - Private Function
    private func updatePicker() {
        datePickerView = DatePickerView(frame: CGRect(x: 0, y: view.bounds.height - 400, width: view.bounds.width, height: 400))
        datePickerView.delegate = self
        datePickerView.configDatePicker(datePickerTextField: dateOfBirthTextField)
        view.addSubview(datePickerView)
    }
    
    private func handleData() {
        guard let name = nameTextField.text, let date = date else { return }
        delegate?.controller(view: self, needsPerform: .update(User(name: name, date: date)))
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - IBAction
    @IBAction private func doneButtonTouchUpInside(_ sender: Any) {
        guard let name = nameTextField.text, let date = date else { return }
        let alertVC = UIAlertController(title: "Warning", message: "Do you want to edit this user with name: \(name) and birthday: \(date)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.handleData()
        }))
        present(alertVC, animated: true)
    }
}

// MARK: - Implement Protocol DatePickerViewDelegate
extension DetailViewController: DatePickerViewDelegate {
    func view(_ view: DatePickerView, needsPerform action: DatePickerView.Action) {
        switch action {
        case .select(date: let date):
            UIView.animate(withDuration: 0.1) {
                self.view.becomeFirstResponder()
            } completion: { [weak self] _ in
                guard let this = self else { return }
                this.date = date
                this.updateUIDateLabel(date: date)
            }
        }
    }

    func updateUIDateLabel(date: Date) {
        let dateFormatter: String = "MMM dd, yyyy"
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatter
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        let dateString = formatter.string(from: date)
        dateOfBirthTextField.text = dateString
    }
}

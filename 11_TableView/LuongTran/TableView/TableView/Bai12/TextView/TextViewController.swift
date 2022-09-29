//
//  TextViewController.swift
//  TableView
//
//  Created by luong.tran on 19/09/2022.
//

import UIKit

protocol TextViewControllerDelegate: AnyObject {
    func vc(vc: TextViewController, needPerform action: TextViewController.Action)
}

final class TextViewController: UIViewController {

    enum Action {
        case senData(data: String)
    }
    
    weak var delegate: TextViewControllerDelegate?
    
    @IBOutlet private weak var inputTextField: UITextField!
    
    var viewModel: TextViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }

    private func configNavigation() {
        title = "Input Insert"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func doneButtonTouchUpInside() {
        guard let viewModel = viewModel else { return }
        viewModel.data = inputTextField.text ?? ""
        delegate?.vc(vc: self, needPerform: .senData(data: viewModel.data))
        navigationController?.popViewController(animated: true)
    }
    
}

//
//  CalculatorViewController.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/5/22.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var inputXTextField: UITextField!
    @IBOutlet private weak var inputYTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var operateButton: UIButton!
    
    // MARK: - Properties
    var myCalculator: MyCalculator!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Override method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        inputXTextField.resignFirstResponder()
        inputYTextField.resignFirstResponder()
    }
    
    // MARK: - Private method
    private func configUI() {
        inputXTextField.layer.borderColor = UIColor.systemGreen.cgColor
        inputXTextField.layer.borderWidth = 2
        inputYTextField.layer.borderColor = UIColor.systemGreen.cgColor
        inputYTextField.layer.borderWidth = 2
        inputXTextField.returnKeyType = .next
        inputYTextField.returnKeyType = .done
        inputXTextField.delegate = self
        inputYTextField.delegate = self
        myCalculator = Bundle.main.loadNibNamed("MyCalculator", owner: self, options: nil)?.first as? MyCalculator
        guard let myCalculator = myCalculator else { return }
        myCalculator.frame = UIScreen.main.bounds
        myCalculator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCalculator.dataSource = self
        view.addSubview(myCalculator)
    }
    
    // MARK: - IBActions
    @IBAction private func operatorButton(_ sender: Any) {
        guard let calculator = myCalculator else { return }
        inputXTextField.resignFirstResponder()
        inputYTextField.resignFirstResponder()
        calculator.delegate = self
        calculator.updateUI()
        calculator.show()
    }
}

// MARK: - Extension
extension CalculatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == inputXTextField {
            inputYTextField.becomeFirstResponder()
        } else if textField == inputYTextField {
            inputYTextField.resignFirstResponder()
            myCalculator.delegate = self
            myCalculator.updateUI()
            myCalculator.show()
        }
        return true
    }
}

extension CalculatorViewController: MyCalculatorDataSource {
    func receiveValue(_ myCalculator: MyCalculator) -> (Int, Int)? {
        guard let x = Int(inputXTextField.text ?? "0"), let y = Int(inputYTextField.text ?? "0") else { return nil }
        return (x,y)
    }
}

extension CalculatorViewController: MyCalculatorDelegate {
    func sendResult(_ view: MyCalculator, needPerformAction action: MyCalculator.Action) {
        switch action {
        case .passResult(value: let value, x: let x, y: let y, operate: let operate):
            if operate == "clear" {
                inputXTextField.text = ""
                inputYTextField.text = ""
                resultLabel.text = ""
            } else {
                resultLabel.text = "\(x) \(operate) \(y) = \(value)"
                operateButton.setTitle(operate, for: .normal)
            }
        }
    }
}

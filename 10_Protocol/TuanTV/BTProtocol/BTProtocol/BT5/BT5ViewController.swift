//
//  BT5ViewController.swift
//  BTProtocol
//
//  Created by Tuan Tran V. VN.Danang on 5/25/22.
//

import UIKit

final class BT5ViewController: UIViewController {
    //MARK: - Property
    var calculator: Calculator?
    var isHidden = true {
        willSet {
            UIView.transition(with: calculator!, duration: 1, options: .transitionCrossDissolve, animations: {
                self.calculator?.isHidden = newValue
                })
        }
    }
    var titleOperationButton: String = "?" {
        willSet {
            calculatorButton.setTitle(newValue, for: .normal)
        }
    }
    
    var resultDisplay: String = "0" {
        willSet {
            resultLabel.text = newValue
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet private weak var firstOperandTextField: UITextField!
    @IBOutlet private weak var secondOperandTextField: UITextField!
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var calculatorButton: UIButton!
    //MARK: -IBActions
    @IBAction private func performCalculator(_ sender: UIButton) {
        isHidden = false
        calculator?.configView()
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(radius: 10, color: .green, borderWidth: 1)
    }
    
    private func setupView(radius: CGFloat, color: UIColor, borderWidth: CGFloat) {
        firstOperandTextField.layer.cornerRadius = radius
        firstOperandTextField.layer.borderColor = color.cgColor
        firstOperandTextField.layer.borderWidth = borderWidth
        secondOperandTextField.layer.cornerRadius = radius
        secondOperandTextField.layer.borderColor = color.cgColor
        secondOperandTextField.layer.borderWidth = borderWidth
        calculatorButton.layer.cornerRadius = radius
        calculator = Bundle.main.loadNibNamed("Calculator", owner: self, options: nil)?[0] as? Calculator
        
        calculator?.frame = CGRect(x: 0,
                                   y: 200,
                                   width: view.frame.width,
                                   height: view.frame.width)
        calculator?.isHidden = true
        calculator?.dataSource = self
        calculator?.delegate = self
        view.addSubview(calculator!)
    }
}

protocol BT5ViewControllerDataSource: class {
    func bt5ViewControllerDataSource(view: Calculator) -> Operand
}

protocol BT5ViewControllerDelegate: class {
    func bt5ViewControllerDelegate(view: Calculator, performNeeded: Action)
}

enum Action {
    case passData(operation: String, result: String, isHidden: Bool)
    case clear(isHidden: Bool, isClear: Bool)
    case cancel(isHidden: Bool)
}

struct Operand {
    var firstOperand: Float = 0
    var secondOperand: Float = 1
}

extension BT5ViewController: BT5ViewControllerDataSource {
    func bt5ViewControllerDataSource(view: Calculator) -> Operand {
        guard let firstOperand = Float(firstOperandTextField.text ?? ""),
              let secondOperand = Float(secondOperandTextField.text ?? "") else {
            return Operand(firstOperand: 0, secondOperand: 0)}
        return Operand.init(firstOperand: firstOperand, secondOperand: secondOperand)
    }
}

extension BT5ViewController: BT5ViewControllerDelegate {
    func bt5ViewControllerDelegate(view: Calculator, performNeeded: Action) {
        switch performNeeded {
        case .passData(operation: let operation, result: let result, isHidden: let isHidden):
            titleOperationButton = operation
            resultDisplay = result
            self.isHidden = isHidden
        case .clear(isHidden: let isHidden, isClear: let isClear):
            self.isHidden = isHidden
            if isClear {
                firstOperandTextField.text = ""
                secondOperandTextField.text = ""
            }
        case .cancel(isHidden: let isHidden):
            self.isHidden = isHidden
        }
    }
}

//
//  Ex12ViewController.swift
//  AutoLayout
//
//  Created by thuan.nguyen on 10/05/2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var equalButton: UIButton!
    private var numberString: String = ""
    private var firstNumber: Double = 0
    private var secondNumber: Double = 0
    private var resultNumber: Double = 0
    private var isOperation: Bool = false
    private var currentOperations: String = ""
    private var calculator: Calculator = Calculator()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func clearResult() {
        resultLabel.text = "0"
        numberString = ""
        resultNumber = 0
        firstNumber = 0
        secondNumber = 0
    }
    
    @IBAction func pressButtonTouchUpInside(_ sender: UIButton) {
        handleActionCaculator(text: sender.titleLabel?.text ?? "")
    }
    
    private func handleResult() {
        caculatorNumber(operation: currentOperations)
        resultLabel.text = floor(resultNumber) == resultNumber ? "\(Int(resultNumber).formattedWithSeparator)" : "\(resultNumber.formattedWithSeparator)"
        firstNumber = resultNumber
        isOperation = false
    }
    
    private func handleActionCaculator(text: String) {
        switch text {
        case "÷", "X", "-", "+":
            if secondNumber != 0 && isOperation {
                handleResult()
            }
            currentOperations = text
            isOperation = true
            numberString = ""
        case "AC":
            clearResult()
            isOperation = false
        case "=":
            handleResult()
        default:
            if numberString.count < 9 {
                numberString.append(contentsOf: text)
                resultLabel.text = String(describing: (Double(numberString) ?? 0).formattedWithSeparator)
                if isOperation {
                    secondNumber = Double(numberString) ?? 0
                } else {
                    firstNumber = Double(numberString) ?? 0
                }
            }
        }
    }
    
    private func caculatorNumber(operation: String) {
        switch operation {
        case "÷":
            resultNumber = calculator.div(a: firstNumber, b: secondNumber)
        case "X":
            resultNumber = calculator.mul(a: firstNumber, b: secondNumber)
        case "-":
            resultNumber = calculator.sub(a: firstNumber, b: secondNumber)
        case "+":
            resultNumber = calculator.add(a: firstNumber, b: secondNumber)
        default: break
        }
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

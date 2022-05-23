//
//  CalculatorViewController.swift
//  BTMVC
//
//  Created by Tuan Tran V. VN.Danang on 5/19/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    private var result: Float = 0
    private var isTyping = false
    var storeOperand = StoreOperand()
    var operation: String = "" {
        didSet {
            guard let a = storeOperand.firstOperand, let b = storeOperand.secondOperand else {return}
            switch oldValue {
            case "+":
                result = ProcessCalculator.shared().add(a: a, b: b)
            case "-":
                result = ProcessCalculator.shared().sub(a: a, b: b)
            case "x":
                result = ProcessCalculator.shared().mul(a: a, b: b)
            case ":":
                result = ProcessCalculator.shared().divide(a: a, b: b)
            case "=":
                print("=")
            default:
                break
            }
            reset()
        }
    }
    
    var displayValue: Float {
        get {
            guard let text = displayLabel.text, let value = Float(text) else {
                return 0
            }
            return value
        }
        set {
            print("display value", newValue)
            displayLabel.text = String(Int(newValue))
        }
    }

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clearResult(_ sender: UIButton) {
        result = 0
        displayValue = result
        storeOperand.firstOperand = nil
        storeOperand.secondOperand = nil
    }
    @IBAction func tapAC(_ sender: UIButton) {
    }
    @IBAction func tapDigit(_ sender: UIButton) {
        
        guard let digit = sender.currentTitle else {return}
        if isTyping {
            let currentTextDisplayLabel = displayLabel.text!
            displayLabel.text = currentTextDisplayLabel + digit
        } else {
            displayLabel.text = digit
            isTyping = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        guard let symbol = sender.currentTitle else {return}
        setOperand(operation: symbol)
    }
    
    private func setOperand(operation: String) {
        if storeOperand.firstOperand == nil {
            storeOperand.firstOperand = displayValue
        } else {
            if isTyping {
                storeOperand.secondOperand = displayValue
            }
        }
        self.operation = operation
        isTyping = false
    }
    
    private func reset() {
        displayValue = result
        isTyping = false
        storeOperand.secondOperand = nil
        storeOperand.firstOperand = result
    }
}

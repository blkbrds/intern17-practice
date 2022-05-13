//
//  CalculatorViewController.swift
//  MVCPattern
//
//  Created by tri.nguyen on 13/05/2022.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var resultCalculatorLabel: UILabel!
    
    // MARK: - Properties
    private var calculator = Calculator()
    private var isValidPress = false
    private var clearDisPlay = false
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction private func numbersButtonTouchUpInside(_ sender: UIButton) {
        isValidPress = true
        if clearDisPlay == true {
            resultCalculatorLabel.text = ""
            clearDisPlay = false
        }
        resultCalculatorLabel.text! += sender.titleLabel!.text!
        calculator.currentNumber = Double(resultCalculatorLabel.text!)!
    }
    
    @IBAction private func plusMinusButtonTouchUpInside(_ sender: Any) {
        calculator.currentNumber = calculator.currentNumber * (-1)
        resultCalculatorLabel.text = String(calculator.currentNumber)
    }
    
    @IBAction private func percentButtonTouchUpInside(_ sender: Any) {
        calculator.currentNumber = calculator.currentNumber * (0.01)
        resultCalculatorLabel.text = String(calculator.currentNumber)
    }
    
    @IBAction private func periodButtonTouchUpInside(_ sender: Any) {
        if !((resultCalculatorLabel.text)?.contains("."))! {
            resultCalculatorLabel.text! += "."
        }
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: Any) {
        clearDisPlay = false
        isValidPress = false
        calculator.clear()
        resultCalculatorLabel.text = ""
    }
    
    @IBAction private func operatorButtonTouchUpInside(_ sender: UIButton) {
        clearDisPlay = true
        if isValidPress {
            if calculator.calculationArray.count == 1 {
                calculator.calculationArray.append(Double(sender.tag))
            } else {
                calculator.calculationArray.append(calculator.currentNumber)
                calculator.calculationArray.append(Double(sender.tag))
            }
        }
        calculator.lastOperation = Double(sender.tag)
        if let result = calculator.calculateValue(opertation: "operation") {
            resultCalculatorLabel.text = getResultAsString(result: result)
        }
        isValidPress = false
    }
    
    @IBAction private func equalButtonTouchUpInside(_ sender: Any) {
        isValidPress = true
        calculator.lastNumber = calculator.currentNumber
        if let result = calculator.calculateValue(opertation: "equals") {
            resultCalculatorLabel.text = getResultAsString(result: result)
        }
    }
    
    // MARK: - Private Function
    private func getResultAsString(result: Double?) -> String{
        if let result = result {
            if result.rounded(.up) == result.rounded(.down){
                // number is integer
                return String(Int(result))
            }else{
                // number is not integer
                return String(result)
            }
        } else {
            return ""
        }
    }
}

//
//  CalculatorViewController.swift
//  MVC
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/28/22.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    // MARK: - Enum
    enum Operation: String {
        case add
        case subtract
        case multiply
        case divide
        case noneType
    }
    
    // MARK: - IBOutlets
    @IBOutlet private var collectionButton: [UIButton]!
    @IBOutlet private var numberButton: [UIButton]!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - MARK: - Properties
    var numberString: String = ""
    var firstNumber: Int = 0
    var a: Float = 0
    var b: Float = 0
    var currentOperations: Operation = .noneType
    var calculator = Calculator()
    var result: Float = 0 {
        didSet {
            if result - Float(Int(result)) == 0 {
                resultLabel.text = "\(Int(result))"
            } else {
                resultLabel.text = "\(result)"
            }
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        for button in collectionButton {
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.gray.cgColor
        }
        for number in numberButton {
            number.tag = Int("\(number.titleLabel!.text!)") ?? 0
            number.addTarget(self, action: #selector(clickNumberButton(sender:)), for: .touchUpInside)
        }
    }
    
    private func calculate(operate: Operation, a: Float, b: Float) -> Float {
        switch operate {
        case .add:
            return calculator.add(a: a, b: b)
        case .subtract:
            return calculator.sub(a: a, b: b)
        case .divide:
            return calculator.div(a: a, b: b)
        case .multiply:
            return calculator.mul(a: a, b: b)
        case .noneType:
            return Float(resultLabel.text!) ?? 0.0
        }
    }
    
    // MARK: - Objcs
    @objc private func clickNumberButton(sender: UIButton){
        guard numberString.count <= 5 else { return }
        numberString += "\(sender.tag)"
        resultLabel.text = numberString
    }
    
    // MARK: - IBAction
    @IBAction private func clearButtonTouchUpInside(_ sender: Any) {
        resultLabel.text = "0"
        numberString = ""
        currentOperations = .noneType
    }
    
    @IBAction private func addButtonTouchUpInside(_ sender: UIButton) {
        guard let resultLabel = resultLabel.text else { return }
        b = Float(resultLabel) ?? 0.0
        result = calculate(operate: currentOperations, a: result, b: b)
        currentOperations = .add
        numberString = ""
    }
    
    @IBAction private func subtractButtonTouchUpInside(_ sender: UIButton) {
        guard let resultLabel = resultLabel.text else { return }
        b = Float(resultLabel) ?? 0.0
        result = calculate(operate: currentOperations, a: result, b: b)
        currentOperations = .subtract
        numberString = ""
    }
    
    @IBAction private func multiplyButtonTouchUpInside(_ sender: UIButton) {
        guard let resultLabel = resultLabel.text else { return }
        b = Float(resultLabel) ?? 0.0
        result = calculate(operate: currentOperations, a: result, b: b)
        currentOperations = .multiply
        numberString = ""
    }
    
    @IBAction private func divideButtonTouchUpInside(_ sender: UIButton) {
        guard let resultLabel = resultLabel.text else { return }
        b = Float(resultLabel) ?? 0.0
        result = calculate(operate: currentOperations, a: result, b: b).rounded()
        currentOperations = .divide
        numberString = ""
    }
    
    @IBAction private func equalButtonTouchUpInside(_ sender: Any) {
        guard let resultLabel = resultLabel.text else { return }
        b = Float(resultLabel) ?? 0.0
        result = calculate(operate: currentOperations, a: result, b: b)
        currentOperations = .noneType
    }
}

//
//  HomeViewController.swift
//  MVC
//
//  Created by luong.tran on 08/09/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    enum StateCalculator {
        case addState
        case minusState
        case multiplyState
        case divideState
        case defaultState
    }
    
    @IBOutlet private var numberButtonCollection: [UIButton]!
    @IBOutlet private var operateButtonCollection: [UIButton]!
    @IBOutlet private weak var resultLabel: UILabel!
    
    private var textNumber: String = ""
    private var calculator = Caculator()
    private var a: Float = 0.0
    private var b: Float = 0.0
    private var currentNumber: Float = 0 {
        didSet {
            if (currentNumber - Float(Int(currentNumber))) == 0 {
                resultLabel.text = "\(Int(currentNumber))"
            } else {
                resultLabel.text = "\(currentNumber)"
            }
        }
    }
    private var stateCalculate: StateCalculator = .defaultState
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configButton()
        
    }
    
    private func calculate(state: StateCalculator, aNumber: Float, bNumber: Float) -> Float {
        switch state {
        case .addState:
            return calculator.add(a: aNumber, b: bNumber)
        case .minusState:
            return calculator.sub(a: aNumber, b: bNumber)
        case .multiplyState:
            return calculator.mul(a: aNumber, b: bNumber)
        case .divideState:
            return calculator.div(a: aNumber, b: bNumber)
        case .defaultState:
            return Float(resultLabel.text!) ?? 0.0
        }
    }

    private func configButton() {
        for numberButton in numberButtonCollection {
            numberButton.addTarget(self, action: #selector(numberButtonTouchUpInside(sender:)), for: .touchUpInside)
        }
        
        for operateButton in operateButtonCollection {
            operateButton.addTarget(self, action: #selector(operateButtonTouchUpInside(sender:)), for: .touchUpInside)
        }
    }
    
    @objc private func numberButtonTouchUpInside(sender: UIButton) {
        guard textNumber.count <= 5 else { return }
        textNumber += "\(sender.tag)"
        resultLabel.text = textNumber
    }
    
    
    @objc private func operateButtonTouchUpInside(sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            if sender.tag == 12 {
                b = Float(resultLabel.text!) ?? 0.0
                currentNumber = calculate(state: stateCalculate, aNumber: currentNumber, bNumber: b)
                stateCalculate = .addState
                textNumber = ""
            } else if sender.tag == 13 {
                b = Float(resultLabel.text!) ?? 0.0
                currentNumber = calculate(state: stateCalculate, aNumber: currentNumber, bNumber: b)
                stateCalculate = .minusState
                textNumber = ""
            } else if sender.tag == 14 {
                b = Float(resultLabel.text!) ?? 0.0
                currentNumber = calculate(state: stateCalculate, aNumber: currentNumber, bNumber: b)
                stateCalculate = .multiplyState
                textNumber = ""
            } else if sender.tag == 15 {
                b = Float(resultLabel.text!) ?? 0.0
                currentNumber = calculate(state: stateCalculate, aNumber: currentNumber, bNumber: b)
                stateCalculate = .divideState
                textNumber = ""
            }
        } else if sender.tag == 16 {
            b = Float(resultLabel.text!) ?? 0.0
            currentNumber = calculate(state: stateCalculate, aNumber: currentNumber, bNumber: b)
            stateCalculate = .defaultState
            textNumber = ""
        } else if sender.tag == 11 {
            textNumber = ""
            resultLabel.text = "0"
            stateCalculate = .defaultState
        }
    }
    
}

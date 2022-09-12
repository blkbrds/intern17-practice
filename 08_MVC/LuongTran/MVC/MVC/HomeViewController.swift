//
//  HomeViewController.swift
//  MVC
//
//  Created by luong.tran on 08/09/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    enum StateCalculator: Int {
        case addState = 12
        case minusState = 13
        case multiplyState = 14
        case divideState = 15
        case defaultState = 16
    }
    
    @IBOutlet private var numberButtons: [UIButton]!
    @IBOutlet private var operateButtons: [UIButton]!
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
        for numberButton in numberButtons {
            numberButton.addTarget(self, action: #selector(numberButtonTouchUpInside(sender:)), for: .touchUpInside)
        }
        
        for operateButton in operateButtons  {
            operateButton.addTarget(self, action: #selector(operateButtonTouchUpInside(sender:)), for: .touchUpInside)
        }
    }
    
    private func handleCurrentState(stateTag: StateCalculator) {
        b = Float(resultLabel.text!) ?? 0.0
        currentNumber = calculate(state: stateCalculate, aNumber: currentNumber, bNumber: b)
        stateCalculate = stateTag
        textNumber = ""
    }
    
    @objc private func numberButtonTouchUpInside(sender: UIButton) {
        guard textNumber.count <= 5 else { return }
        textNumber += "\(sender.tag)"
        resultLabel.text = textNumber
    }
    
    @objc private func operateButtonTouchUpInside(sender: UIButton) {
        switch sender.tag {
        case 11:
            textNumber = ""
            resultLabel.text = "0"
            stateCalculate = .defaultState
        case 12...16:
            handleCurrentState(stateTag: StateCalculator(rawValue: sender.tag) ?? .defaultState)
        default:
            break
        }
    }
    
}

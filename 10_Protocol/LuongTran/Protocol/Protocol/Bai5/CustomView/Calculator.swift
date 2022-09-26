//
//  Calculator.swift
//  Protocol
//
//  Created by luong.tran on 15/09/2022.
//

import UIKit

protocol CalculatorDelegate: AnyObject {
    func view(view: Calculator, needPerform action: Calculator.Action)
}

protocol CalculatorDataSource: AnyObject {
    func getX() -> String
    func getY() -> String
}

final class Calculator: UIView {
    
    enum Action {
        case sendData(operate: String)
        case clearData
        case cancelView
    }

    @IBOutlet private weak var valueALabel: UILabel!
    @IBOutlet private weak var valueBLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var operateButtons: [UIButton]!
    
    private var stateCalculate = Caculator()
    private var number1: Int = 0
    private var number2: Int = 0
    private var status: String = ""
    private var result: Float = 0.0 {
        didSet {
            updateValue()
        }
    }
    
    weak var delegate: CalculatorDelegate?
    weak var dataSource: CalculatorDataSource? {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configButton()
    }
    
    private func configButton() {
        for operateButton in operateButtons {
            operateButton.layer.cornerRadius = 10
            operateButton.addTarget(self, action: #selector(operateButtonTouchUpInside(sender:)), for: .touchUpInside)
        }
    }
    
    private func updateValue() {
        resultLabel.text = "Result = \(result)"
        guard let dataSource = dataSource else {
            return
        }
        valueALabel.text = "X: \(dataSource.getX())"
        valueBLabel.text = "Y: \(dataSource.getY())"
        if let valueX = Int(dataSource.getX()), let valueY = Int(dataSource.getY()) {
            number1 = valueX
            number2 = valueY
        }
    }
    
    @IBAction private func doneButtonTouchUpInside(_ sender: Any) {
        delegate?.view(view: self, needPerform: .sendData(operate: status))
    }
    @IBAction private func cancelButtonTouchUpInside(_ sender: Any) {
        delegate?.view(view: self, needPerform: .cancelView)
    }
    
    @objc private func operateButtonTouchUpInside(sender: UIButton) {
        updateValue()
        for button in operateButtons {
            button.backgroundColor = sender.titleLabel?.text == button.titleLabel?.text ? .green : .white
            if button.titleLabel?.text == "Clear" { button.backgroundColor = .lightGray}
        }
        switch sender.tag {
        case 11:
            result = Float(stateCalculate.add(a: number1, b: number2))
            status = "+"
        case 12:
            result = Float(stateCalculate.sub(a: number1, b: number2))
            status = "-"
        case 13:
            result = Float(stateCalculate.mul(a: number1, b: number2))
            status = "*"
        case 14:
            result = Float(stateCalculate.div(a: number1, b: number2))
            status = "/"
        default:
            status = "Clear"
            result = 0.0
            valueALabel.text = "X: ?"
            valueBLabel.text = "Y: ?"
            delegate?.view(view: self, needPerform: .clearData)
        }
    }
}

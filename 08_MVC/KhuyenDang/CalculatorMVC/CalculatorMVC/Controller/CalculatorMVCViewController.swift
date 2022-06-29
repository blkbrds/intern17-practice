//
//  CalculatorMVCViewController.swift
//  CalculatorMVC
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/28/22.
//

import UIKit

final class CalculatorMVCViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet private var collectionButton: [UIButton]!
    @IBOutlet private var numbersButton: [UIButton]!
    @IBOutlet private var operatesButton: [UIButton]!
    @IBOutlet private weak var resultLabel: UILabel!
    
    //MARK: - Properties
    var textNumber: String = ""
    var calculator = Calcultor()
    var a: Float = 0.0
    var b: Float = 0.0
    var current: Float = 0 {
        didSet {
            if (current - Float(Int(current))) == 0 {
                resultLabel.text = "\(Int(current))"
            } else {
                resultLabel.text = "\(current)"
            }
        }
    }
    var operate: TypeCalculator = .noneType
    
    enum TypeCalculator: String {
        case add
        case sub
        case mul
        case div
        case noneType
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    //MARK: - Private methods
    private func configUI()
    {
        for button in collectionButton {
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.gray.cgColor
        }

        for button in numbersButton {
            button.tag = Int("\(button.titleLabel!.text!)") ?? 0
            button.addTarget(self, action: #selector(clickButton(sender:)), for: .touchUpInside)
        }
    }

    private func calculate(operate: TypeCalculator, a: Float, b: Float) -> Float {
        switch operate {
        case .add:
            return calculator.add(a: a, b: b)
        case .sub:
            return calculator.sub(a: a, b: b)
        case .div:
            return calculator.div(a: a, b: b)
        case .mul:
            return calculator.mul(a: a, b: b)
        case .noneType:
            return Float(resultLabel.text!) ?? 0
        }
    }

    //MARK: - objc
    @objc private func clickButton(sender: UIButton) {
        guard textNumber.count <= 5 else { return }
            textNumber += "\(sender.tag)"
            resultLabel.text = textNumber
    }
    
    //MARK: - IBAction
    @IBAction private func inverseButton(_ sender: Any) {
        current =  (Float(resultLabel.text!) ?? 0.0) / (-1)
    }

    @IBAction private func percentButton(_ sender: Any) {
        current = (Float(resultLabel.text!) ?? 0.0) / 100
    }

    @IBAction private func dotButton(_ sender: Any) {
        textNumber += "."
        resultLabel.text = textNumber
    }

    @IBAction private func addButton(_ sender: UIButton) {
        b = Float(resultLabel.text!) ?? 0.0
        current = calculate(operate: operate, a: current, b: b)
        operate = .add
        textNumber = ""
    }

    @IBAction private func subButton(_ sender: Any) {
        b = Float(resultLabel.text!) ?? 0.0
        current = calculate(operate: operate, a: current, b: b)
        operate = .sub
        textNumber = ""
    }

    @IBAction private func mulButton(_ sender: Any) {
        b = Float(resultLabel.text!) ?? 0.0
        current = calculate(operate: operate, a: current, b: b)
        operate = .mul
        textNumber = ""
    }

    @IBAction private func divButton(_ sender: Any) {
        b = Float(resultLabel.text!) ?? 0.0
        current = calculate(operate: operate, a: current, b: b)
        operate = .div
        textNumber = ""
    }

    @IBAction private func acButton(_ sender: Any) {
        resultLabel.text = "0"
        textNumber = ""
        operate = .noneType
    }

    @IBAction private func resultButton(_ sender: Any) {
        b = Float(resultLabel.text!) ?? 0.0
        current = calculate(operate: operate, a: current, b: b)
        operate = .noneType
    }
}

//
//  CalculatorViewController.swift
//  MVC
//
//  Created by tri.nguyen on 17/04/2022.
//

import UIKit

final class CalculatorViewController: UIViewController {

    // MARK: - Properties
    private var calculatorAction = CalculatorAction()
    private var performMath: Bool = true
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
    }
    
    // MARK: - Private Functions
    private func configurationUI() {
        guard let newCalculationView = Bundle.main.loadNibNamed("CalculationView", owner: self, options: nil)?.first as? CalculationView else { return }
        newCalculationView.delegate = self
        newCalculationView.datasource = self
        view.addSubview(newCalculationView)
    }
    
    private func deleteNumber() {
        calculatorAction.deleteNumber()
    }
    
    private func setNumber(number: String) {
        if performMath {
            var number1: String = calculatorAction.number1 ?? ""
            number1 += number
            calculatorAction.number1 = number1
        } else {
            var number2: String = calculatorAction.numnber2 ?? ""
            number2 += number
            calculatorAction.numnber2 = number2
        }
    }
    
    private func getData() -> String {
        if performMath {
            guard let numberOne = calculatorAction.number1 else { return "" }
            return numberOne
        } else {
            guard let numberTwo = calculatorAction.numnber2 else { return ""}
            return numberTwo
        }
    }
    
    private func resultCalculation() -> String? {
        guard let number1 = calculatorAction.number1, let number2 = calculatorAction.numnber2 else { return nil }
        guard let numberOne = Float(number1), let numberTwo = Float(number2), let operatorAction = calculatorAction.operatorAction else { return nil }
        
        // singleton
        return String(Calculator.shared().resultNumber(number1: numberOne, number2: numberTwo, operatorAction: operatorAction))
    }
}

// MARK: - Extention CalculationDelegate
extension CalculatorViewController: CalculationViewDelegate {
    func view(_ view: CalculationView, needsPerforms action: CalculationView.Action) {
        switch action {
        case .sendOperator(operattor: let action):
            calculatorAction.operatorAction = calculatorAction.performCalculations(action: action)
            performMath = false
        case .sendNumber(number: let number):
            print(number)
            setNumber(number: number)
        case .deleteNumber:
            deleteNumber()
            performMath = true
        }
    }
}

// MARK: - Extention CalculationDataSource
extension CalculatorViewController: CalculationViewDataSource {
    func getData(_ view: CalculationView) -> String {
        return getData()
    }
    
    func getResult(_ view: CalculationView) -> String? {
        guard let result = resultCalculation() else { return "" }
        return result
    }
}

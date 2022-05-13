//
//  Calculator.swift
//  MVCPattern
//
//  Created by tri.nguyen on 13/05/2022.
//

import Foundation

struct Enumerations {
    // MARK: - Define
    enum Operations: Int {
        case add = 0
        case subtract = 1
        case multiply = 2
        case divide = 3
    }
}

final class Calculator {
    
    // MARK: - Properties
    var calculationArray = [Double]()
    var lastNumber: Double = 0.0
    var lastOperation: Double = 0.0
    var currentNumber: Double = 0.0
    
    // MARK: - Public Function
    func clear() {
        calculationArray = []
        lastNumber = 0.0
        lastOperation = 0.0
        currentNumber = 0.0
    }
    
    func calculateValue(opertation: String) -> Double? {
        if opertation == "operation" {
            if calculationArray.count > 3 {
                let newValue = calculate(firstNumber: calculationArray[0], secondNumber: calculationArray[2], operation: Int(calculationArray[1]))
                calculationArray.removeAll()
                calculationArray.append(newValue)
                calculationArray.append(lastOperation)
                return calculationArray[0]
            }
        } else if opertation == "equals" {
            if calculationArray.count >= 1 {
                // Calculate
                let newValue = calculate(firstNumber: calculationArray[0], secondNumber: lastNumber, operation: Int(lastOperation))
                calculationArray.removeAll()
                calculationArray.append(newValue)
                return calculationArray[0]
            }
        }
        return nil
    }
    
    // MARK: - Private Function
    private func calculate(firstNumber: Double, secondNumber: Double, operation: Int) -> Double {
        var total = 0.0
        if let oprations = Enumerations.Operations(rawValue: operation) {
            switch oprations {
            case .add:
                total = firstNumber + secondNumber
            case .subtract:
                total = firstNumber - secondNumber
            case .multiply:
                total = firstNumber * secondNumber
            case .divide:
                if firstNumber == 0 {
                    return 0
                } else {
                    total = firstNumber / secondNumber
                }
            }
        }
        return Double(floor(1000 * total) / 1000)
    }
}

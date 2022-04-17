//
//  Calculator.swift
//  MVC
//
//  Created by tri.nguyen on 17/04/2022.
//

import Foundation

final class Calculator {
    
    // MARK: - Singleton
    private static var sharedCalculator: Calculator = {
        let calculator = Calculator()
        return calculator
    }()
    
    class func shared() -> Calculator {
        return sharedCalculator
    }
        
    // MARK: - Functions
    func addNumber(number1: Float, number2: Float) -> Float {
        return number1 + number2
    }
    
    func subNumber(number1: Float, number2: Float) -> Float {
        return number1 - number2
    }
    
    func mulNumber(number1: Float, number2: Float) -> Float {
        return number1 * number2
    }
    
    func divNumber(number1: Float, number2: Float) -> Float {
        if number2 == 0 {
            return 0
        } else {
            return number1 / number2
        }
    }
    
    func resultNumber(number1: Float, number2: Float, operatorAction: Operator) -> Float {
        switch operatorAction {
        case .add:
            return addNumber(number1: number1, number2: number2)
        case .sub:
            return subNumber(number1: number1, number2: number2)
        case .mul:
            return mulNumber(number1: number1, number2: number2)
        case .div:
            return divNumber(number1: number1, number2: number2)
        }
    }
}

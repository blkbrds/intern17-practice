//
//  Operator.swift
//  MVC
//
//  Created by tri.nguyen on 17/04/2022.
//

import Foundation

// MARK: - Enum
enum Operator {
    case add
    case sub
    case mul
    case div
}

final class CalculatorAction {

    // MARK: - Properties
    var number1: String?
    var numnber2: String?
    var operatorAction: Operator?
    
    func performCalculations(action: String) -> Operator {
        if action == "+" {
            return .add
        } else if action == "-" {
            return .sub
        } else if action == "x" {
            return .mul
        } else {
            return .div
        }
    }
    
    func deleteNumber() {
        number1 = nil
        numnber2 = nil
    }
}

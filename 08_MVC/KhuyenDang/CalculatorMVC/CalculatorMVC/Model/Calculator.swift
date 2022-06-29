//
//  Calculator.swift
//  CalculatorMVC
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/28/22.
//

import Foundation
final class Calcultor {
    
    func add(a: Float, b: Float) -> Float {
        return a + b
    }
    
    func sub(a: Float, b: Float) -> Float {
        return a - b
    }
    
    func mul(a: Float, b: Float) -> Float {
        return a * b
    }
    
    func div(a: Float, b: Float) -> Float {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
}

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
        return b == 0 ? 0 : a/b
    }
}

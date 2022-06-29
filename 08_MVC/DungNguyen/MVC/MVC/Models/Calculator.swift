//
//  Calculator.swift
//  MVC
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/28/22.
//

import Foundation

final class Calculator {
    
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

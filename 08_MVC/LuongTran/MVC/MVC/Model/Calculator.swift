//
//  Calculator.swift
//  MVC
//
//  Created by luong.tran on 08/09/2022.
//

import Foundation

final class Caculator {
    
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
        return b == 0 ? 0 : a / b
    }
    
    
}

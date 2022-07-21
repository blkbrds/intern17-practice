//
//  Calculator.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/5/22.
//

import Foundation
final class Calculator {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func sub(a: Int, b: Int) -> Int {
        return a - b
    }
    
    func mul(a: Int, b: Int) -> Int {
        return a * b
    }
    
    func div(a: Int, b: Int) -> Float {
        return b == 0 ? 0 : Float(a)/Float(b)
    }
    
    func mod(a: Int, b: Int) -> Int {
        return b == 0 ? 0 : a%b
    }
    
    func pow(a: Int, b: Int) -> Int {
        var result: Int = 1
        if b == 0 { return 1} else {
            for _ in 0..<b {
                result *= a
            }
            return result
        }
    }
}

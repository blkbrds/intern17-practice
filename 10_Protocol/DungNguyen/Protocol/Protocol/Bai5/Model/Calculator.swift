//
//  Calculator.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/5/22.
//

import Foundation

final class Calculator {

    func add(x: Float, y: Float) -> Float {
        return x + y
    }

    func sub(x: Float, y: Float) -> Float {
        return x - y
    }

    func mul(x: Float, y: Float) -> Float {
        return x * y
    }

    func div(x: Float, y: Float) -> Float {
        return y == 0 ? 0 : x / y
    }
    
    func mod(x: Int, y: Int) -> Int {
        return y == 0 ? 0 : x%y
    }
     
    func power(x: Float, y: Float) -> Float {
        return y == 0 ? 0 : pow(x, y)
    }
}

//
//  ProcessCalculator.swift
//  BTMVC
//
//  Created by Tuan Tran V. VN.Danang on 5/19/22.
//

import Foundation

final class ProcessCalculator {
    private static var processCalculator: ProcessCalculator = {
        return ProcessCalculator()
    }()
    
    class func shared() -> ProcessCalculator {
        return processCalculator
    }
    
    private init(){}
    
    func add(a: Float, b: Float) -> Float {
        return a + b
    }
    
    func sub(a: Float, b: Float) -> Float {
        return a - b
    }
    
    func mul(a: Float, b: Float) -> Float {
        return a * b
    }
    
    func divide(a: Float, b: Float) -> Float {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
    
    func performCalculator() {
        print("a")
    }
}

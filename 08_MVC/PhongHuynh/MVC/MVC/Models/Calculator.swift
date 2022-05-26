import UIKit

final class Calculator {
    
    // MARK: - Methods
    func add(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func sub(a: Double, b: Double) -> Double {
        return a - b
    }
    
    func mul(a: Double, b: Double) -> Double {
        return a * b
    }
    
    func div(a: Double, b: Double) -> Double {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
}

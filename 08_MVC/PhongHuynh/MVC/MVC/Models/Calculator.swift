import UIKit

final class Calculator {
    
    // MARK: - Properties
    var numberOnScreen: Double
    var previousNumber: Double
    
    init(numberOnScreen: Double, previousNumber: Double) {
        self.numberOnScreen = numberOnScreen
        self.previousNumber = previousNumber
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

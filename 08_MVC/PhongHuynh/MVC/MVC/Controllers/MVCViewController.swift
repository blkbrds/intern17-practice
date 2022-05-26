import UIKit

final class MVCViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - Properties
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    var result: Double = 0
    let caculator = Calculator()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction private func numbers(_ sender: UIButton) {
        if performingMath {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction private func calculatorTouchUpInside(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            guard let text = label.text, let number = Double(text) else { return }
            previousNumber = number
            if sender.tag == 12 {
                label.text = "+"
            }
            if sender.tag == 13 {
                label.text = "-"
            }
            if sender.tag == 14 {
                label.text = "*"
            }
            if sender.tag == 15 {
                label.text = "/"
            }
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 16 {
            if operation == 12 {
                result = caculator.add(a: numberOnScreen, b: previousNumber)
                label.text = "\(result)"
            } else if operation == 13 {
                result = caculator.sub(a: previousNumber, b: numberOnScreen)
                label.text = "\(result)"
            } else if operation == 14 {
                result = caculator.mul(a: numberOnScreen, b: previousNumber)
                label.text = "\(result)"
            } else if operation == 15 {
                result = caculator.div(a: numberOnScreen, b: previousNumber)
                label.text = "\(result)"
            }
        } else if sender.tag == 11 {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}

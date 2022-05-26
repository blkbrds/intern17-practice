//
//  Calculator.swift
//  BTProtocol
//
//  Created by Tuan Tran V. VN.Danang on 5/25/22.
//

import UIKit

final class Calculator: UIView {
    weak var dataSource: BT5ViewControllerDataSource?
    weak var delegate: BT5ViewControllerDelegate?
    var x: Float = 0
    var y: Float = 0
    var result: Float = 0 {
        willSet {
            resultLabel.text = String(newValue)
        }
    }
    var operation: String = ""
    //MARK: - IBOutlets
    @IBOutlet weak var firstOperand: UILabel!
    @IBOutlet weak var secondOperand: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var multiButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var chiaDuButton: UIButton!
    @IBOutlet weak var muButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    //MARK: - IBActions
    @IBAction func performCalculator(_ sender: UIButton) {
        print("vo day chua")
        guard let operation = sender.currentTitle else {return}
        switch operation {
        case "+":
            self.operation = "+"
            result = x + y
        case "-":
            self.operation = "-"
            result = x - y
        case "x":
            self.operation = "x"
            result = x * y
        case "/":
            self.operation = "/"
            if y != 0 {
             result = x / y
            } else {
                result = 0
            }
        case "%":
            self.operation = "%"
            if y != 0 {
                result = x.truncatingRemainder(dividingBy: y)
            } else {
                result = 0
            }
        case "x^y":
            self.operation = "x^y"
            result = pow(x, y)
        default:
            break
        }
    }
    @IBAction func doneTapped(_ sender: UIButton) {
        guard let titleButton = sender.currentTitle,
              let delegate = delegate else {return}
        switch titleButton {
        case "Cancel":
            delegate.bt5ViewControllerDelegate(view: self, performNeeded: .cancel(isHidden: true))
        case "Clear":
            delegate.bt5ViewControllerDelegate(view: self, performNeeded: .clear(isHidden: true, isClear: true))
        case "Done":
            delegate.bt5ViewControllerDelegate(view: self, performNeeded: .passData(operation: operation, result: String(result), isHidden: true))
        default:
            break
        }
    }
    
    //MARK: -LifeCycle
    override func awakeFromNib() {
        setupView(borderWidth: 1, color: .green, radius: 10)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView(borderWidth: CGFloat, color: UIColor, radius: CGFloat) {
        addButton.layer.borderWidth = borderWidth
        subButton.layer.borderWidth = borderWidth
        multiButton.layer.borderWidth = borderWidth
        divideButton.layer.borderWidth = borderWidth
        chiaDuButton.layer.borderWidth = borderWidth
        muButton.layer.borderWidth = borderWidth
        clearButton.layer.borderWidth = borderWidth
        
        addButton.layer.borderColor = color.cgColor
        subButton.layer.borderColor = color.cgColor
        multiButton.layer.borderColor = color.cgColor
        divideButton.layer.borderColor = color.cgColor
        chiaDuButton.layer.borderColor = color.cgColor
        muButton.layer.borderColor = color.cgColor
        clearButton.layer.borderColor = color.cgColor
        
        addButton.layer.cornerRadius = radius
        subButton.layer.cornerRadius = radius
        multiButton.layer.cornerRadius = radius
        divideButton.layer.cornerRadius = radius
        chiaDuButton.layer.cornerRadius = radius
        muButton.layer.cornerRadius = radius
    }
    
    func configView() {
        if let dataSource = dataSource {
            let operand: Operand =
                dataSource.bt5ViewControllerDataSource(view: self)
            x = operand.firstOperand
            y = operand.secondOperand
            firstOperand.text = "X = \(x)"
            secondOperand.text = "Y = \(y)"
        }
    }
}

//
//  CalculatorView.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/5/22.
//

import UIKit

// MARK: - Protocols
protocol CalculatorViewDataSource: AnyObject {
    func passValue(_ calculatorView: CalculatorView) -> (Int, Int)?
}

protocol CalculatorViewDelegate: AnyObject {
    func toSendResult(_ view: CalculatorView, needsPerfom actions: CalculatorView.Action)
}

final class CalculatorView: UIView {
    
    // MARK: - Define
    enum Action {
        case done(result: Float, operation: Operation)
        case clear(x: String, y: String, result: String)
    }

    // MARK: - IBOutlets
    @IBOutlet private var collectionButton : [UIButton]!
    @IBOutlet private weak var markView: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var valueXLabel: UILabel!
    @IBOutlet private weak var valueYLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Properties
    weak var dataSource: CalculatorViewDataSource!
    weak var delegate: CalculatorViewDelegate!
    
    var calculator = Calculator()
    var operater: Operation = .add
    var (x1, y1): (Int, Int) = (0, 0)
    var result: Float = 0 {
        didSet {
            if result - Float(Int(result)) == 0 {
                resultLabel.text = "\(Int(result))"
            } else {
                resultLabel.text = "\(result)"
            }
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        configButton()
        configView()
    }

    // MARK: - Private functions
    private func configButton() {
        for button in collectionButton {
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.systemGreen.cgColor
            if button.titleLabel?.text == "Clear" {
                button.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
    
    private func configView() {
        bottomConstraint.constant = -350
        markView.alpha = 0
        self.isHidden = true
    }
    
    func show() {
        self.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.markView.alpha = 0.3
        } completion: { _ in
            UIView.animate(withDuration: 1.0) {
                self.bottomConstraint.constant = 0
            }
        }
    }
    
    private func hide() {
        UIView.animate(withDuration: 1.0) {
            self.bottomConstraint.constant = -350
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.markView.alpha = 0.0
            } completion: { _ in
                self.isHidden = true
            }
        }
    }
    
    func upValue() {
        guard let value = dataSource?.passValue(self) else {
            return
        }
        valueXLabel.text = "\(value.0)"
        valueYLabel.text = "\(value.1)"
        (x1, y1) = (value.0, value.1)
    }
    
    // MARK: - IBActions
    @IBAction private func done(_ sender: Any) {
        delegate?.toSendResult(self, needsPerfom: .done(result: result, operation: operater))
        hide()
    }
    
    @IBAction private func cancel(_ sender: Any) {
        hide()
    }
    
    @IBAction private func operaterButton(_ sender: UIButton) {
        for button in collectionButton {
            if button.tag == 6 {
                button.backgroundColor = .lightGray
            } else if sender.tag == button.tag {
                button.backgroundColor = .green
                button.setTitleColor(.white, for: .normal)
            } else {
                button.backgroundColor = .white
                button.setTitleColor(.black, for: .normal)
            }
        }
        switch sender.tag {
        case 0:
            operater = .add
            result = calculator.add(x: Float(x1), y: Float(y1))
        case 1:
            operater = .sub
            result = calculator.sub(x: Float(x1), y: Float(y1))
        case 2:
            operater = .mul
            result = calculator.mul(x: Float(x1), y: Float(y1))
        case 3:
            operater = .div
            result = calculator.div(x: Float(x1), y: Float(y1))
        case 4:
            operater = .mod
            result = Float(calculator.mod(x: x1, y: y1))
        case 5:
            operater = .power
            result = calculator.power(x: Float(x1), y: Float(y1))
        default:
            operater = .clear
            hide()
            valueXLabel.text = ""
            valueYLabel.text = ""
            resultLabel.text = ""
            if let x = valueYLabel.text, let y = valueYLabel.text, let result = resultLabel.text {
                delegate?.toSendResult(self, needsPerfom: .clear(x: x, y: y, result: result))
            }
        }
    }
}

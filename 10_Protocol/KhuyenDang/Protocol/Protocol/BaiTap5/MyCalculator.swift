//
//  MyCalculator.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/5/22.
//

import UIKit

protocol MyCalculatorDataSource: AnyObject {
    func receiveValue(_ myCalculator: MyCalculator) -> (Int, Int)?
}

protocol MyCalculatorDelegate: AnyObject {
    func sendResult(_ view: MyCalculator, needPerformAction action: MyCalculator.Action)
}

final class MyCalculator: UIView {

    // MARK: - IBOutlets
    @IBOutlet private var collectionButton: [UIButton]!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var markView: UIView!
    @IBOutlet private weak var valueX: UILabel!
    @IBOutlet private weak var valueY: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!

    // MARK: - Properties
    enum Action {
        case passResult(value: Float, x: Int, y: Int, operate: String)
    }
    weak var delegate: MyCalculatorDelegate?
    weak var dataSource: MyCalculatorDataSource?
    var operate: String = ""
    let calculator =  Calculator()
    var result: Float = 0.0 {
        didSet {
            if (result - Float(Int(result))) == 0 {
                resultLabel.text = "\(Int(result))"
            } else {
                resultLabel.text = "\(result)"
            }
        }
    }
    var (x,y): (Int,Int) = (0,0)

    // MARK: - Life cycle
    override func awakeFromNib() {
        configUIMyCalculator()
    }

    // MARK: - Private methods
    private func configUIMyCalculator() {
        for button in collectionButton {
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.systemGreen.cgColor
            button.addTarget(self, action: #selector(operatorButtonTouchUpInside(sender:)), for: .touchUpInside)
        }
        // hide view
        bottomConstraint.constant = -400
        markView.alpha = 0
        self.isHidden = true
    }

    // MARK: - Objc
    @objc func operatorButtonTouchUpInside(sender: UIButton) {
        for button in collectionButton {
            button.backgroundColor = sender.titleLabel?.text == button.titleLabel?.text ? .green : .white
            if button.titleLabel?.text == "Clear" { button.backgroundColor = .lightGray}
        }
        switch sender.titleLabel?.text {
        case "+":
            result = Float(calculator.add(a: x, b: y))
            operate = "+"
        case "-":
            result = Float(calculator.sub(a: x, b: y))
            operate = "-"
        case "*":
            result = Float(calculator.mul(a: x, b: y))
            operate = "*"
        case "/":
            result = calculator.div(a: x, b: y)
            operate = "/"
        case "%":
            result = Float(calculator.mod(a: x, b: y))
            operate = "%"
        case "x^y":
            result = Float(calculator.pow(a: x, b: y))
            operate = "^"
        default:
            hide()
            operate = "clear"
            (x, y) = (0, 0)
            valueX.text = ""
            valueY.text = ""
            resultLabel.text = ""
            delegate?.sendResult(self, needPerformAction: .passResult(value: result, x: x, y: y, operate: operate))
        }
    }
    
    //MARK: - Display
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            if touch.view == markView {
                hide()
            }
        }
    }

    func show() {
        self.isHidden = false
        
        UIView.animate(withDuration: 0.2) {
            self.markView.alpha = 0.3
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.bottomConstraint.constant = 0
            } completion: { _ in }
        }
    }

    func hide() {
        UIView.animate(withDuration: 0.2) {
            self.bottomConstraint.constant = -400
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.markView.alpha = 0.0
            } completion: { _ in
                self.isHidden = true
            }
        }
    }

    func updateUI() {
        guard let value = dataSource?.receiveValue(self) else { return }
        valueX.text = "\(value.0)"
        valueY.text = "\(value.1)"
        (x,y) = (value.0, value.1)
    }
    
    // MARK: - IBActions
    @IBAction func doneButton(_ sender: Any) {
        delegate?.sendResult(self, needPerformAction: .passResult(value: result, x: x, y: y, operate: operate))
        hide()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        hide()
    }
}

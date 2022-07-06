//
//  CalculatorViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/5/22.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var inputXTextField: UITextField!
    @IBOutlet private weak var inputYTextField: UITextField!
    @IBOutlet private weak var questionMarkButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Properties
    var calculatorView: CalculatorView!
    var result: Float = 0 {
        didSet {
            if result - Float(Int(result)) == 0{
                resultLabel.text = "= \(Int(result))"
            } else {
                resultLabel.text = "= \(result)"
            }
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
    }
    
    // MARK: - Private functions
    private func configUI() {
        calculatorView = UINib(nibName: "CalculatorView", bundle: .main).instantiate(withOwner: self).first as? CalculatorView
        calculatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        calculatorView.frame = UIScreen.main.bounds
        self.view.addSubview(calculatorView)
        calculatorView.dataSource = self
        calculatorView.delegate = self
        
        inputXTextField.delegate = self
        inputYTextField.delegate = self
        
        inputXTextField.setCorner()
        inputYTextField.setCorner()
        questionMarkButton.setCorner()
    }
    
    // MARK: - IBActions
    @IBAction private func questionMarkTouchUpInside(_ sender: Any) {
        if let contentView = calculatorView {
            contentView.show()
            calculatorView.upValue()
            inputXTextField.resignFirstResponder()
            inputYTextField.resignFirstResponder()
        }
    }
}

// MARK: - Extensions
extension UIView {
    func setCorner() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.systemGreen.cgColor
        layer.borderWidth = 1.0
        layer.masksToBounds = true
    }
}

extension CalculatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == inputXTextField {
            inputYTextField.becomeFirstResponder()
        } else if textField == inputYTextField {
            inputYTextField.resignFirstResponder()
            calculatorView.show()
            calculatorView.upValue()
        }
        return true
    }
}

extension CalculatorViewController: CalculatorViewDataSource {
    func passValue(_ calculatorView: CalculatorView) -> (Int, Int)? {
        guard let x = Int(inputXTextField.text ?? "0"), let y = Int(inputYTextField.text ?? "0") else {
            return nil
        }
        return(x, y)
        
    }
}

extension CalculatorViewController: CalculatorViewDelegate {
    func toSendResult(_ view: CalculatorView, needsPerfom actions: CalculatorView.Action) {
        switch actions {
        case .done(result: let result, operation: let operation):
            self.result = result
            questionMarkButton.setTitle(operation, for: .normal)
        case .clear(x: let x, y: let y, result: let result):
            inputXTextField.text = x
            inputYTextField.text = y
            resultLabel.text = result
        }
    }
}

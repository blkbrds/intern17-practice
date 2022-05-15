//
//  CalculatorViewController.swift
//  Protocol
//
//  Created by tri.nguyen on 23/04/2022.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var xValueTextField: UITextField!
    @IBOutlet private weak var yValueTextField: UITextField!
    @IBOutlet private weak var resultValueLabel: UILabel!
    
    // MARK: - Properties
    private var calculatorAction = SelectCalculatorView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        guard let newCalculator = Bundle.main.loadNibNamed("SelectCalculatorView", owner: self, options: nil)?.first as? SelectCalculatorView else { return }
        newCalculator.frame = CGRect(x: 0, y: 350, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 350)
        newCalculator.configView()
        newCalculator.delegate = self
        newCalculator.datasource = self
        view.addSubview(newCalculator)
    }
    
    // MARK: - Action
    @IBAction private func displayCalculatorButton(_ sender: Any) {
        calculatorAction.isHidden = false
        UIView.animate(withDuration: 1.0, animations: {
            self.setupUI()
        })
    }
}

// MARK: - Extention Calculator Delegate && Datasource
extension CalculatorViewController: SelectCalculatorViewDelgate, SelectCalculatorDataSource  {
    
    func view(_ view: SelectCalculatorView, needsPerform action: SelectCalculatorView.Action) {
        switch action {
        case .getResult(resultValue: let resultSuccess):
            resultValueLabel.text = resultSuccess
        case .clearResult(clearValue: let clearTextSuccess):
            xValueTextField.text = clearTextSuccess
            yValueTextField.text = clearTextSuccess
        }
    }
    
    func getValueX() -> Int? {
        guard let xValue = xValueTextField.text else { return 0 }
        return Int(xValue)
    }
    
    func getValueY() -> Int? {
        guard let yValue = yValueTextField.text else { return 0 }
        return Int(yValue)
    }
}

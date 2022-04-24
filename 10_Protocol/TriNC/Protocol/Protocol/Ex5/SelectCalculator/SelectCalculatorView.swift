//
//  SelectCalculatorView.swift
//  Protocol
//
//  Created by tri.nguyen on 23/04/2022.
//

import Foundation
import UIKit

// MARK: - Protocol
protocol SelectCalculatorViewDelgate: class {
    func view(_ view: SelectCalculatorView, needsPerform action: SelectCalculatorView.Action)
}

protocol SelectCalculatorDataSource: class {
    func getValueX() -> Int?
    func getValueY() -> Int?
}

final class SelectCalculatorView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var xValueLabel: UILabel!
    @IBOutlet private weak var yValueLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: SelectCalculatorViewDelgate?
    weak var datasource: SelectCalculatorDataSource?
    private var result: Double?
    
    // MARK: - Functions
     func configView() {
        guard let x = datasource?.getValueX(), let y = datasource?.getValueY() else { return }
        xValueLabel.text = String(x)
        yValueLabel.text = String(y)
    }
    
    // MARK: - IBActions
    @IBAction private func cancelButtonTouchUpInside(_ sender: Any) {
        self.isHidden = true
    }
    
    @IBAction private func doneButtonTouchupInside(_ sender: Any) {
        self.isHidden = true
        guard let result = result, let delegate = delegate else { return }
        delegate.view(self, needsPerform: .getResult(resultValue: String(result)))
    }
    
    @IBAction private func handleCalculatorButton(_ sender: UIButton) {
        guard let x = datasource?.getValueX(), let y = datasource?.getValueY() else { return }
        switch sender.tag {
        case 1:
            result = Double(x + y)
        case 2:
            result = Double(x - y)
        case 3:
            result = Double(x * y)
        case 4:
            if y == 0 {
                result = 0
            } else {
                result = Double(x / y)
            }
        case 5:
            result = Double(x % y)
        case 6:
            result = Double(pow(Double(x), Double(y)))
        default:
            clearButtonTouchUpInside(self)
        }
        guard let result = result else { return }
        resultLabel.text = String(result)
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: Any) {
        xValueLabel.text = ""
        yValueLabel.text = ""
        guard let delegate = delegate else { return }
        delegate.view(self, needsPerform: .clearResult(clearValue: ""))
    }
}

// MARK: - Extention
extension SelectCalculatorView {
    // MARK: - Define
    enum Action {
        case getResult(resultValue: String)
        case clearResult(clearValue: String)
    }
}

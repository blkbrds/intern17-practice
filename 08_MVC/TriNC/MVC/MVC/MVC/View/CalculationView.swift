//
//  CalculationView.swift
//  MVC
//
//  Created by tri.nguyen on 17/04/2022.
//

import Foundation
import UIKit

// MARK: - Protocol
protocol CalculationViewDelegate: class {
    func view(_ view: CalculationView, needsPerforms action: CalculationView.Action)
}

protocol CalculationViewDataSource: class {
    func getData(_ view: CalculationView) -> String
    func getResult(_ view: CalculationView) -> String?
}
 
final class CalculationView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: CalculationViewDelegate?
    weak var datasource: CalculationViewDataSource?
    
    // MARK: - Life cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBActions
    @IBAction func numberButtonTouchUpInside(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        delegate?.view(self, needsPerforms: .sendNumber(number: number))
        guard let result = datasource?.getData(self) else { return }
        resultLabel.text = result
    }
    
    @IBAction private func performCalButtonTouchUpInside(_ sender: UIButton) {
        guard let operation = sender.titleLabel?.text else { return }
        delegate?.view(self, needsPerforms: .sendOperator(operattor: operation))
    }
    
    @IBAction func handleDeleteButtonTouchUpInside(_ sender: Any) {
        resultLabel.text?.removeAll()
        delegate?.view(self, needsPerforms: .deleteNumber)
    }
    
    @IBAction private func handleResultButtonTouchUpInside(_ sender: UIButton) {
        guard let result = datasource?.getResult(self) else { return }
        resultLabel.text = result
    }
}

// MARK: - Extention
extension CalculationView {
    enum Action {
        case sendNumber(number: String)
        case sendOperator(operattor: String)
        case deleteNumber
    }
}

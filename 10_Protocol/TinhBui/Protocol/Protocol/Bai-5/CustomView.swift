//
//  CustomView.swift
//  Protocol
//
//  Created by Tinh Bui T. VN.Danang on 6/2/22.
//

import UIKit

// MARK: - CustomViewDelegate
protocol CustomViewDelegate: class {
    func view(view: CustomView, needsPerfom actions: CustomView.Action)
}

// MARK: - CustomViewDatasource
protocol CustomViewDatasource: class {
    func getData() -> (x: String, y: String)
}

final class CustomView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var xLabel: UILabel!
    @IBOutlet private weak var yLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var calculaButton: [UIButton]!
    
    // MARK: - Properties
    var number1: Double = 0
    var number2: Double = 0
    weak var delegate: CustomViewDelegate?
    weak var datasource: CustomViewDatasource?
    
    // MARK: - Defile
    enum Action {
        case cancel
        case done(result: String)
        case clear(x: String, y: String)
    }
    
    // MARK: - Functions
    func getDatas() {
        let data = datasource?.getData()
        xLabel.text = (data?.x)
        yLabel.text = data?.y
    }
    private func changebg(tag: Int) {
        for button in calculaButton {
            button.backgroundColor = button.tag == tag ? .blue : .systemGray5
        }
    }
    
    // MARK: - IBActions
    @IBAction private func cancelButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(view: self, needsPerfom: .cancel)
    }
    
    @IBAction private func doneButtonTouchUpInside(_ sender: UIButton) {
        if let delegate = delegate, let result = resultLabel.text {
            delegate.view(view: self, needsPerfom: .done(result: result))
        }
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
        xLabel.text = ""
        yLabel.text = ""
        if let x = xLabel.text, let y = yLabel.text {
            delegate?.view(view: self, needsPerfom: .clear(x: x, y: y))
        }
    }

    @IBAction private func calcuButton(_ sender: UIButton) {
        changebg(tag: sender.tag)
        guard let x = xLabel.text,
              let y = yLabel.text,
              let numberX = Double(x),
              let numberY = Double(y) else { return }
        number1 = numberX
        number2 = numberY
        switch sender.tag {
        case 0:
            resultLabel.text = String(number1 + number2)
        case 1:
            resultLabel.text = String(number1 - number2)
        case 2:
            resultLabel.text = String(number1 * number2)
        case 3:
            resultLabel.text = String(number1 / number2)
        case 4:
            resultLabel.text = String(number1.truncatingRemainder(dividingBy: number2))
        case 5:
            resultLabel.text = String(pow(number1, number2))
        default:
            break
        }
    }
}

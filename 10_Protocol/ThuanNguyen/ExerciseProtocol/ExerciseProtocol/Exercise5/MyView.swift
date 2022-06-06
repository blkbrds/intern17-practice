//
//  MyView.swift
//  DemoProtocol
//
//  Created by thuan.nguyen on 20/05/2022.
//

import UIKit

protocol MyViewDelegate: class {
    func updateController(view: MyView, needsPerform action: MyView.Action)
}

class MyView: UIView {
    
    @IBOutlet private weak var secondNumberLabel: UILabel!
    @IBOutlet private weak var numberFirstLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    // MARK: - protocols
    var delegate: MyViewDelegate?
    enum Action {
        case tap(result: String)
    }
    
    var numberFirst: Int = 0 {
        didSet {
            numberFirstLabel.text = String(numberFirst)
        }
    }
    var numberSecond: Int = 0 {
        didSet {
            secondNumberLabel.text = String(numberSecond)
        }
    }
    var result: Float = 0
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateView() {
        numberFirstLabel.text = String(numberFirst)
        secondNumberLabel.text = String(numberSecond)
    }
    
    @IBAction private func doneAction() {
        if let rs = resultLabel.text, let delegate = delegate {
            delegate.updateController(view: self, needsPerform: .tap(result: rs))
        }
    }
   
    @IBAction private func addButtonTouchUpInside(_ sender: Any) {
        resultLabel.text = String(numberFirst + numberSecond)
    }
    
    @IBAction private func subButtonTouchUpInside(_ sender: Any) {
        resultLabel.text = String(numberFirst - numberSecond)
    }
    
    @IBAction private func mulButtonTouchUpInside(_ sender: Any) {
        resultLabel.text = String(numberFirst * numberSecond)
    }
    
    @IBAction private func divButtonTouchUpInside(_ sender: Any) {
        resultLabel.text = String(numberFirst / numberSecond)
    }
}

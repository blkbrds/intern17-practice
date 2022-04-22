import UIKit

// MARK: - SelectViewDatasource
protocol SelectViewDatasource {
    
    func setXY() -> (x: String, y: String)
}

// MARK: - SelectViewDelegate
protocol SelectViewDelegate {
    
    func view(view: SelectView, needsPerfom actions: SelectView.Action)
}

class SelectView: UIView {
    
    enum Action {
        case done(result: String, operation: Operation)
        case cancel
        case clear(x: String, y: String)
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var xLabel: UILabel!
    @IBOutlet private weak var yLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var operationButton: [UIButton]!
    
    // MARK: - Properties
    var result: String?
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation: Operation = .cong
    var dataSource: SelectViewDatasource? {
        didSet {
            receiveValue()
            changeBoderButton()
        }
    }
    var delegate: SelectViewDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.transform = CGAffineTransform(scaleX: 0.3, y: 2)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.transform = .identity
        })
        self.alpha = 1
    }
    
    // MARK: - IBActions
    @IBAction private func calculatorButton(_ sender: UIButton) {
        changeColer(tag: sender.tag)
        guard let x = xLabel.text,
              let y = yLabel.text,
              let numberX = Double(x),
              let numberY = Double(y) else { return }
        numberOnScreen = numberX
        previousNumber = numberY
        switch sender.tag {
        case 0:
            resultLabel.text = String(numberOnScreen + previousNumber)
            operation = .cong
        case 1:
            resultLabel.text = String(numberOnScreen - previousNumber )
            operation = .tru
        case 2:
            resultLabel.text = String(numberOnScreen * previousNumber)
            operation = .nhan
        case 3:
            resultLabel.text = String(numberOnScreen / previousNumber)
            operation = .chia
        case 4:
            resultLabel.text = String(numberOnScreen / previousNumber)
            operation = .phantram
        case 5:
            resultLabel.text = String(numberOnScreen / previousNumber)
            operation = .luythua
        default:
            break
        }
    }
    
    // MARK: - IBActions
    @IBAction private func cancleButton(_ sender: Any) {
        delegate?.view(view: self, needsPerfom: .cancel)
    }
    
    @IBAction private func doneButton(_ sender: UIButton) {
        if let result = resultLabel.text {
            self.delegate?.view(view: self, needsPerfom: .done(result: result, operation: operation))
        }
    }
    @IBAction func clearButton(_ sender: Any) {
        xLabel.text = ""
        yLabel.text = ""
        if let x = xLabel.text, let y = yLabel.text {
            delegate?.view(view: self, needsPerfom: .clear(x: x, y: y))
        }
    }
    
    // MARK: - Private functions
    private func changeColer(tag: Int) {
        for button in operationButton {
            button.backgroundColor = button.tag == tag ? .blue : .white
        }
    }
    
    private func receiveValue() {
        let value = dataSource?.setXY()
        xLabel.text = value?.x
        yLabel.text = value?.y
    }
    
    private func changeBoderButton() {
        for boder in operationButton {
            boder.layer.borderWidth = 1
            boder.layer.borderColor = UIColor.black.cgColor
        }
    }
}

import UIKit


protocol SelectViewDatasource {
    
    func setXY() -> (x: String, y: String)
}

protocol SelectViewDelegate {
    func backResult(view: SelectView, needsPerfom actions: SelectView.Action)
}

class SelectView: UIView {
    
    enum Action {
        case tap(result: String)
       }

    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var operationButton: [UIButton]!
    
    var x: String = ""
    var y: String = ""
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var dataSource: SelectViewDatasource? {
        didSet {
            receiveValue()
        }
    }
    var delegate: SelectViewDelegate?
    
    
    @IBAction func calculatorButton(_ sender: UIButton) {
        changeColer(tag: sender.tag)
        guard let x = xLabel.text,
              let y = yLabel.text,
              let numberX = Double(x),
              let numberY = Double(y) else { return }
        numberOnScreen = numberX
        previousNumber = numberY
        if sender.tag == 1 {
            resultLabel.text = String(previousNumber + numberOnScreen)
        }
        if sender.tag == 2 {
            resultLabel.text = String(numberOnScreen - previousNumber)
        }
        if sender.tag == 3 {
            resultLabel.text = String(numberOnScreen * previousNumber)
        }
        if sender.tag == 4 {
            resultLabel.text = String(numberOnScreen / previousNumber)
        }
        if sender.tag == 5 {
            resultLabel.text = String(numberOnScreen / previousNumber)
        }
        if sender.tag == 6 {
            resultLabel.text = String(numberOnScreen / previousNumber)
        }
        if let result = resultLabel.text {
            self.delegate?.backResult(view: self, needsPerfom: .tap(result: result))
        }
    }
    
    private func changeColer(tag: Int) {
        for button in operationButton {
            button.backgroundColor = button.tag == tag ? .red : .white
        }
    }
    
    private func receiveValue() {
        let value = dataSource?.setXY()
        xLabel.text = value?.x
        yLabel.text = value?.y
    }
}

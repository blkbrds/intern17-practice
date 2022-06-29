import UIKit

final class CaculatorViewController: UIViewController {
    
    @IBOutlet private var operationCollectionButton: [UIButton]!
    @IBOutlet private var numberCollectionButton: [UIButton]!
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var caculatorLabel: UILabel!
    
    var textNumber: String = ""
    var count: Int = 0
    var countNumber: Int = 0
    var countPressed: Int = 0
    var dem: Int = 0
    var arrayNumber: [Float] = []
    var phepToan: [Int] = []
    var calculator = CaculatorModel()
    var a = UIButton()
    
    var value: Float {
        return Float(caculatorLabel.text ?? "5.0") ?? 0
    }
    
    var result: Float = 0 {
        didSet {
            caculatorLabel.text = String(format: "%.3f", result)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        for i in numberCollectionButton{
            i.layer.borderWidth = 0.5
            guard let title = i.titleLabel?.text else {
                return
            }
            i.tag = Int("\(title)") ?? 0
            i.addTarget(self, action: #selector(buttonNumberDidClick(sender:)), for: .touchUpInside)
        }
        
        for i in operationCollectionButton{
            i.layer.borderWidth = 0.5
            i.addTarget(self, action: #selector(buttonOperationDidClick(sender:)), for: .touchUpInside)
            i.tag = count
            count += 1
        }
        deleteButton.layer.borderWidth = 0.5
        deleteButton.addTarget(self, action: #selector(deleteAll(sender:)), for: .touchUpInside)
        
    }
    
    @objc private func deleteAll(sender: UIButton) {
        caculatorLabel.text = "0"
        arrayNumber.removeAll()
        phepToan.removeAll()
        dem = 0
        countNumber = 0
        textNumber = ""
        countPressed = 0
    }
    
    @objc private func buttonNumberDidClick(sender: UIButton) {
        if dem != 0 {
            caculatorLabel.text = ""
            textNumber = ""
            dem = 0
            countNumber = 0
            a.backgroundColor = UIColor.systemOrange
        }
        
        if countNumber < 6 {
            textNumber += "\(sender.tag)"
            caculatorLabel.text = textNumber
            countNumber += 1
        }
    }
    
    @objc private func buttonOperationDidClick(sender: UIButton) {
        switch sender.tag {
        case 0:
            arrayNumber.append(value)
            countPressed += 1
            dem += 1
            textNumber = ""
            caculate(phepToan[0])
            phepToan.removeAll()
            countPressed = 0
        case 1...4:
            a = sender
            a.backgroundColor = UIColor.red
            if textNumber != "" {
                arrayNumber.append(value)
            }
            countPressed += 1
            dem += 1
            caculate(sender.tag)
        default:
            return
        }
    }
    
    @IBAction private func percentNumber(_ sender: Any) {
        result = value / 100
    }
    
    
    @IBAction private func inverseNumber(_ sender: Any) {
        result = -value
    }
    
    @IBAction private func dotNumber(_ sender: Any) {
        textNumber += "."
        caculatorLabel.text = textNumber
    }
    
    
    private func caculate(_ tag: Int) {
        phepToan.append(tag)
        if countPressed == 2 {
            switch phepToan[0]{
            case 1:
                result = calculator.add(a: arrayNumber[0], b: arrayNumber[1])
            case 2:
                result = calculator.sub(a: arrayNumber[0], b: arrayNumber[1])
            case 3:
                result = calculator.mul(a: arrayNumber[0], b: arrayNumber[1])
            case 4:
                result = calculator.div(a: arrayNumber[0], b: arrayNumber[1])
            default:
                return
            }
            arrayNumber[0] = result
            arrayNumber.removeLast()
            countPressed = 1
            phepToan.removeFirst()
        }
    }
}

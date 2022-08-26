import UIKit

protocol SubViewControllerDataSource: AnyObject {
    func getXValue() -> Int
    func getYValue() -> Int
}

protocol SubViewControllerDelegate: AnyObject {
    func vc(_ vc: SubView, needsPerform action: SubView.Action)
}

class SubView: UIView{
    
    enum Action {
        case operateButtonTapped(type: String, value: Int)
        case clearButtonTapped
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var number1Label: UILabel!
    @IBOutlet weak var number2Label: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var markView: UIView!
    
    weak var dataSource: SubViewControllerDataSource?
    weak var delegate: SubViewControllerDelegate?
    var number1: Int = 0
    var number2: Int = 0
    var status: String = ""
    var result: Int = 0 {
        didSet {
            resultLabel.text = "Result = \(result)"
        }
    }
    
    func configView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.superview!.topAnchor),
            self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor),
        ])
        for i in buttonCollection {
            i.layer.borderWidth = 0.5
            i.layer.cornerRadius = 10
        }
        bottomConstraint.constant = -430
        markView.alpha = 0
        self.isHidden = true
    }
    
    func getData() {
        guard let dataSource = dataSource else {
            return
        }
        number1Label.text = "X = \(dataSource.getXValue())"
        number2Label.text = "Y = \(dataSource.getYValue())"
        number1 = dataSource.getXValue()
        number2 = dataSource.getYValue()
    }
    
    func show() {
        self.isHidden = false
        
        UIView.animate(withDuration: 0.3) {
            self.markView.alpha = 0.3
        } completion: { _ in
            UIView.animate(withDuration: 1.0) {
                self.bottomConstraint.constant = 0
            } completion: { _ in
                
            }
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 1.0) {
            self.bottomConstraint.constant = -430
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.markView.alpha = 0.0
            } completion: { _ in
                self.isHidden = true
            }
        }
    }
    
    @IBAction func addButtonTouchUpInside(_ sender: UIButton) {
        result = number1 + number2
        status = "+"
    }
    
    @IBAction func subButtonTouchUpInside(_ sender: UIButton) {
        result = number1 - number2
        status = "-"
    }
    
    @IBAction func mulButtonTouchUpInside(_ sender: UIButton) {
        result = number1 * number2
        status = "x"
    }
    
    @IBAction func divButtonTouchUpInside(_ sender: UIButton) {
        result = number1 / number2
        status = "/"
    }
    
    @IBAction func percentButtonTouchUpInside(_ sender: UIButton) {
        result = number1 % number2
        status = "%"
    }
    
    @IBAction func powButtonTouchUpInside(_ sender: UIButton) {
        result = Int(pow(Double(number1), Double(number2)))
        status = "X ^ Y"
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: UIButton) {
        delegate?.vc(self, needsPerform: .clearButtonTapped)
        hide()
    }
    
    @IBAction func cancelButtonTouchUpInside(_ sender: UIButton) {
        hide()
    }
    
    @IBAction func doneButtonTouchUpInside(_ sender: UIButton) {
        delegate?.vc(self, needsPerform: .operateButtonTapped(type: status, value: result))
        hide()
    }
    
}

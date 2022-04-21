import UIKit

protocol SelectViewControllerDelegate {
    func setXY(view: SelectViewController, needsPerfom actions: SelectViewController.Action)
}

class SelectViewController: UIViewController {
    
    enum Action {
        case tap(operation: String, result: String)
       }
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var tinhtoanButton: [UIButton]!
    
    var x: String = ""
    var y: String = ""
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var result: String = ""
    var delegate: SelectViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select"
        let leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = rightButton
        
        xLabel.text = x
        yLabel.text = y
    }
    
    @objc func cancelAction() {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func doneAction() {
        
    }

    @IBAction func clearButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func changeColerButton(_ sender: UIButton) {
        changeColer(tag: sender.tag)
    }
    
    private func changeColer(tag: Int) {
        for button in tinhtoanButton {
            button.backgroundColor = button.tag == tag ? .orange : .white
        }
    }
    @IBAction func calculatorTouchUpInside(_ sender: UIButton) {
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
    }
    
  
}

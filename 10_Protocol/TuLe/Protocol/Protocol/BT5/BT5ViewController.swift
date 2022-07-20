import UIKit

final class BT5ViewController: UIViewController {
    
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var caculateButton: UIButton!
    
    var subView: SubView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subView = UINib(nibName: "SubView", bundle: .main).instantiate(withOwner: self).first as? SubView
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subView.frame = UIScreen.main.bounds
        self.view.addSubview(subView)
        subView.configView()
    }
    
    @IBAction private func showSubViewTouchUpInside(_ sender: Any) {
        if let subView = subView {
            subView.show()
            subView.dataSource = self
            subView.delegate = self
            subView.getData()
        }
    }
}

extension BT5ViewController: SubViewControllerDelegate {
    func vc(_ vc: SubView, needsPerform action: SubView.Action) {
        switch action {
        case .operateButtonTapped(type: let type, value: let value):
            caculateButton.titleLabel?.text = type
            resultLabel.text = "\(value) ="
        case .clearButtonTapped:
            number1TextField.text = ""
            number2TextField.text = ""
            resultLabel.text = "???? ="
            caculateButton.titleLabel?.text = "?"
        }
    }
}

extension BT5ViewController: SubViewControllerDataSource {
    func getXValue() -> Int {
        return Int(number1TextField.text ?? "") ?? 0
    }

    func getYValue() -> Int {
        return Int(number2TextField.text ?? "") ?? 0
    }
}

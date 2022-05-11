import UIKit

// MARK: - Define
enum Operation {
    case cong
    case tru
    case nhan
    case chia
    case phantram
    case luythua
    var title: String {
        switch self {
        case .cong:
            return "+"
        case .tru:
            return "-"
        case .nhan:
            return "*"
        case .chia:
            return "/"
        case .phantram:
            return "%"
        case .luythua:
            return "x^y"
        }
    }
}

final class Bai05ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var xTextField: UITextField!
    @IBOutlet private weak var yTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var operationButton: UIButton!
    
    // MARK: - Properties
    var selectView = SelectView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private functions
    private func setView(view: UIView, isHidden: Bool) {
        UIView.transition(with: view, duration: 3, options: .transitionCrossDissolve, animations: {
            view.isHidden = isHidden
        })
    }
    
    // MARK: - IBActions
    @IBAction private func push(_ sender: Any) {
        guard let selectView = Bundle.main.loadNibNamed("SelectView", owner: self, options: nil)?.first as? SelectView else { return }
        self.selectView = selectView
        selectView.frame = CGRect(x: 0, y: view.bounds.maxY - (view.bounds.height/3), width: view.bounds.width, height: view.bounds.height / 3)
        selectView.dataSource = self
        selectView.delegate = self
        view.addSubview(selectView)
    }
}

// MARK: - SelectViewDatasource
extension Bai05ViewController: SelectViewDatasource {
    
    func setXY() -> (x: String, y: String) {
        guard let x = xTextField.text, let y = yTextField.text else {
            return ("0", "0")
        }
        return (x,y)
    }
}

// MARK: - SelectViewDelegate
extension Bai05ViewController: SelectViewDelegate {
    
    func view(view: SelectView, needsPerfom actions: SelectView.Action) {
        switch actions {
        case .done(let result, let operation):
            resultLabel.text = result
            operationButton.setTitle(operation.title, for: .normal)
            UIView.transition(with: selectView, duration: 0.7,
                              options: [.curveEaseOut,
                                        .transitionFlipFromTop],
                              animations: {
                                self.selectView.alpha = 0.1
                              },
                              completion: { _ in
                                self.selectView.removeFromSuperview()
                              }
            )
        case .cancel:
            UIView.transition(with: selectView, duration: 0.7,
                              options: [.curveEaseOut,
                                        .transitionFlipFromTop],
                              animations: {
                                self.selectView.alpha = 0.1
                              },
                              completion: { _ in
                                self.selectView.removeFromSuperview()
                              }
            )
        case .clear(let x, let y):
            xTextField.text = x
            yTextField.text = y
        }
    }
}   

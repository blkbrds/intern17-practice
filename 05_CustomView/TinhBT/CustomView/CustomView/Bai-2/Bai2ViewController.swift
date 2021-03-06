

import UIKit

final class Bai2ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var inputTextField: UITextField!
    
    // MARK: - Properties
    var mySliderView = MyView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        mySliderView = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.first as! MyView
        mySliderView.frame = CGRect(x: view.frame.origin.x, y: 150, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100)
        mySliderView.isUserInteractionEnabled = true
        mySliderView.delegate = self
        view.addSubview(mySliderView)
    }
}

// MARK: - MyViewDelegate
extension Bai2ViewController: MyViewDelegate {
    func view(view: MyView, needPerform action: MyView.Action) {
        switch action {
        case .sendData(value: let value):
            inputTextField.text = value
        }
    }
}

// MARK: - UITextFieldDelegate
extension Bai2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let value = textField.text else {
            return false
        }
        mySliderView.value = Int(value)
        mySliderView.updateView()
        return true
    }
}




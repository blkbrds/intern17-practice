

import UIKit

class Bai2ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    var mySliderView = MyView()
    
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

extension Bai2ViewController: MyViewDelegate {
    func view(view: MyView, needPerform action: MyView.Action) {
        switch action {
        case .sendData(value: let value):
            inputTextField.text = value
        }
    }
}

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




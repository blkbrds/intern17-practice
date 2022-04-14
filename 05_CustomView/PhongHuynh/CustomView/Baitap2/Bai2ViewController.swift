import UIKit

final class Bai2ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var valueTextField: UITextField!
    
    var sliderView: MySliderView = MySliderView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        guard let mySliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView else { return }
        sliderView = mySliderView
        sliderView.frame = CGRect(x: 50, y: 100, width: 250, height: 530)
        sliderView.delegate = self
        valueTextField.delegate = self
        view.addSubview(sliderView)
        valueTextField.returnKeyType = .done
    }
    
}
// MARK: - MySliderDelegate
extension Bai2ViewController: MySliderDelegate {
    func didFull(view: MySliderView, needsPerfom action: MySliderView.Action) {
        switch action {
        case .tap(let value):
            valueTextField.text = value
        }
    }
}
// MARK: - UITextFieldDelegate
extension Bai2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let value = Int(valueTextField.text ?? "") {
            if value > 100 || value < 0 {
                print("nhap lai")
            } else {
                sliderView.value = value
            }
        } else {
            print("nhap sai roiiiii")
        }
    return true
    }
}
  


import UIKit

protocol EditViewDelegate: class {
    func view(view: EditViewController, needPerform action: EditViewController.Action )
}

final class EditViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPassTextField: UITextField!
    @IBOutlet private weak var comfirmPassTextFiled: UITextField!
    
    weak var delegate: EditViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit"
        createButton()
    }
    
    func createButton() {
        let donButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        donButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        donButton.setTitle("Done", for: .normal)
        donButton.setTitleColor(.blue, for: .normal)
        let rightBarButton = UIBarButtonItem(customView: donButton)
        navigationItem.rightBarButtonItem = rightBarButton
        
        let cancleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        cancleButton.addTarget(self, action: #selector(cancle), for: .touchUpInside)
        cancleButton.setTitle("Cancle", for: .normal)
        cancleButton.setTitleColor(.blue, for: .normal)
        let leftBarButton = UIBarButtonItem(customView: cancleButton)
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func done() {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
        delegate?.view(view: self, needPerform: .sendData(value: usernameTextField.text ?? "" ))
    }
    
    @objc func cancle() {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
}

extension EditViewController {
    
    enum Action {
        case sendData(value: String)
    }
}

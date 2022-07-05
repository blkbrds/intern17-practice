import UIKit

protocol EditViewControllerDelegate: AnyObject {
    func editView(_ vc: EditViewController, needsPerform action: EditViewController.Action)
}
 
final class EditViewController: UIViewController {
    
    enum Action {
        case doneButtonTapped(value: String)
    }
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    weak var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        let editButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpinside(_:)))
        
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func doneButtonTouchUpinside(_ sender: UIButton) {
        guard let usernameTextField = usernameTextField.text, !usernameTextField.isEmpty,
                let passwordTextField = passwordTextField.text, !passwordTextField.isEmpty,
              let confirmPasswordTextField = confirmPasswordTextField.text, !confirmPasswordTextField.isEmpty, confirmPasswordTextField == passwordTextField else{
            return
        }
        delegate?.editView(self, needsPerform: .doneButtonTapped(value: usernameTextField))
        self.navigationController?.popViewController(animated: true)
    }
}

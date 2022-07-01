import UIKit

protocol EditViewControllerDelegate: AnyObject {
    func editView(_ view: EditViewController, data: String)
}
 
final class EditViewController: UIViewController {
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    weak var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        let editButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonPressed(_:)))
        
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func doneButtonPressed(_ sender: UIButton) {
        guard let usernameTextField = usernameTextField.text, usernameTextField.isEmpty != true,
                let passwordTextField = passwordTextField.text, passwordTextField.isEmpty != true,
              let confirmPasswordTextField = confirmPasswordTextField.text, confirmPasswordTextField.isEmpty != true, confirmPasswordTextField == passwordTextField else{
            return
        }
        delegate?.editView(self, data: usernameTextField)
        self.navigationController?.popViewController(animated: true)
    }
}

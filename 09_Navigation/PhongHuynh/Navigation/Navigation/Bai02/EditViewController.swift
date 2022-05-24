import UIKit

// MARK: - EditViewControllerDelegate
protocol EditViewControllerDelegate: class {
    func controller(view: EditViewController, needsPerfom actions: EditViewController.Action)
}

final class EditViewController: UIViewController {
    
    // MARK: - Define
    enum Action {
        case tap(username: String)
    }
    
    // MARK: - Properties
    weak var delegate: EditViewControllerDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newpasswordTextField: UITextField!
    @IBOutlet private weak var confirmpasswordTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit"
        let leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    // MARK: - Objc functions
    @objc private func leftAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func rightAction() {
        if let username = usernameTextField.text, let delegate = delegate {
            delegate.controller(view: self, needsPerfom: .tap(username: username))
        }
        self.navigationController?.popViewController(animated: true)
    }
}

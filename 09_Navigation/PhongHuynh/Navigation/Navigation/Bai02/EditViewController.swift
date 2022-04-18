import UIKit

// MARK: - EditDelegate
protocol EditDelegate: class {
    func didTap(view: EditViewController, needsPerfom actions: EditViewController.Action)
}

final class EditViewController: UIViewController {
    
    enum Action {
        case tap(username: String)
    }
    
    // MARK: - Properties
    var username: String?
    weak var delegate: EditDelegate?
    
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
    @objc func leftAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightAction() {
        username = usernameTextField.text
        if let username = username {
            print(username)
            delegate?.didTap(view: self, needsPerfom: .tap(username: username))
        }
        self.navigationController?.popViewController(animated: true)
    }
}

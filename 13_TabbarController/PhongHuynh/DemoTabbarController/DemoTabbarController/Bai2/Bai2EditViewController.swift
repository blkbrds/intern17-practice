import UIKit

// MARK: - EditViewControllerDelegate
protocol Bai2EditViewControllerDelegate: class {
    func controller(view: Bai2EditViewController, needsPerfom actions: Bai2EditViewController.Action)
}

class Bai2EditViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newpasswordTextField: UITextField!
    @IBOutlet private weak var confirmpasswordTextField: UITextField!
    
    // MARK: - Define
    enum Action {
        case tap(username: String)
    }
    
    // MARK: - Properties
    var username: String?
    weak var delegate: Bai2EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit"
        let leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func leftAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func rightAction() {
     //   username = usernameTextField.text
        if let username = usernameTextField.text, let delegate = delegate {
            delegate.controller(view: self, needsPerfom: .tap(username: username))
        }
        self.navigationController?.popViewController(animated: true)
    }

}

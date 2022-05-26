import UIKit

// MARK: - Bai2EditViewControllerDelegate
protocol Bai2EditViewControllerDelegate: class {
    func controller(controller: Bai2EditViewController, needsPerfom actions: Bai2EditViewController.Action)
}

final class Bai2EditViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newpasswordTextField: UITextField!
    @IBOutlet private weak var confirmpasswordTextField: UITextField!
    
    // MARK: - Define
    enum Action {
        case tap(userName: String)
    }
    
    // MARK: - Properties
    weak var delegate: Bai2EditViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private functions
    private func configUI() {
        title = "Edit"
        let leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftButtonTouchUpInside))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightButtonTouchUpInside))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    // MARK: - Objc functions
    @objc private func leftButtonTouchUpInside() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func rightButtonTouchUpInside() {
        if let userName = usernameTextField.text, let delegate = delegate {
            delegate.controller(controller: self, needsPerfom: .tap(userName: userName))
        }
        self.navigationController?.popViewController(animated: true)
    }
}

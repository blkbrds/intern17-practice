import UIKit

// MARK: - ProfileViewControllerDelegate
protocol ProfileViewControllerDelegate: class {
    func controller(view: ProfileViewController, needsPerfom actions: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {
    
    // MARK: - Define
    enum Action {
        case tap(username: String)
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Properties
    var name: String = ""
    weak var delegate: ProfileViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneButton
        nameTextField.text = name
    }
    
    // MARK: - Objc funtions
    @objc func doneAction() {
        if let delegate = delegate, let name = nameTextField.text {
            delegate.controller(view: self, needsPerfom: .tap(username: name))
        }
        self.navigationController?.popViewController(animated: true)
    }
}

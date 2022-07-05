import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    func view(_ view: ProfileViewController, data: String)
}

final class ProfileViewController: UIViewController {
    @IBOutlet weak var updateUserTextField: UITextField!
    
    var username: String = ""
    var delegate: ProfileViewControllerDelegate?
    var getValueTextField: String {
        get {
            return updateUserTextField.text ?? ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpinside(_:)))
        
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUserTextField.text = username
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @objc private func doneButtonTouchUpinside(_ sender: UIButton) {
        delegate?.view(self, data: getValueTextField)
        navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController: MyUserViewDataSource {
    func view() -> String {
        return username
    }
}

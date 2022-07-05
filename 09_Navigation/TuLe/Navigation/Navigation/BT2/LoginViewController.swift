import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Login"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpinside(_:)))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func doneButtonTouchUpinside(_ sender: UIButton) {
        guard let listAccount = getDataPlist(withName: "accList") else{
            return
        }
        
        guard let usernameTextField = usernameTextField.text, usernameTextField.isEmpty != true,
              let passwordTextField = passwordTextField.text, passwordTextField.isEmpty != true else{
            return
        }
        
        for (key, value) in listAccount {
            guard let value = value as? NSDictionary else{
                return
            }
            if usernameTextField == value["username"] as? String && passwordTextField == value["password"] as? String {
                let homeViewController = HomeViewController()
                homeViewController.username = usernameTextField
                navigationController?.pushViewController(homeViewController, animated: true)
                break
            }
        }
    }
    
    private func getDataPlist(withName name: String) -> [String: Any]?
    {
        var config: [String: Any]?
        if let infoPlistPath = Bundle.main.url(forResource: name, withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    config = dict
                }
            } catch {
                print(error)
            }
        }
        
        return config
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

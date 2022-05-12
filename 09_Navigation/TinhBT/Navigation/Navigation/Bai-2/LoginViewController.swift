

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    var hvc = HomeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        let donButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        donButton.addTarget(self, action: #selector(don), for: .touchUpInside)
        donButton.setTitle("Done", for: .normal)
        donButton.setTitleColor(.blue, for: .normal)
        let rightBarButton = UIBarButtonItem(customView: donButton)
        navigationItem.rightBarButtonItem = rightBarButton
        
        hvc.delegate = self
    }
    
    @objc func don() {
        if userNameTextField.text == "tinh123" && passwordTextField.text == "123" {
            navigationController?.pushViewController(hvc, animated: true)
            hvc.username = userNameTextField.text ?? ""
        }
    }
}

extension LoginViewController: HomeViewDelegate {
    
    func view(view: HomeViewController, needPerform action: HomeViewController.Action ) {
        switch action {
        
        case .logout:
            userNameTextField.text = ""
            passwordTextField.text = ""
        }
    }
}

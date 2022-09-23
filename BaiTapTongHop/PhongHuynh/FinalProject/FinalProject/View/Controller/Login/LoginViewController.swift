import UIKit
import GoogleSignIn
import SwiftUtils

@available(iOS 13.0, *)
final class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var loginFacebookButton: UIButton!
    @IBOutlet private weak var loginGmailButton: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // MARK: - Private functions
    private func configUI() {
        loginFacebookButton.layer.cornerRadius = 8
        loginFacebookButton.layer.borderWidth = 0.5
        loginFacebookButton.layer.borderColor = UIColor.white.cgColor
        loginGmailButton.layer.cornerRadius = 8
        loginGmailButton.layer.borderWidth = 0.5
        loginGmailButton.layer.borderColor = UIColor.white.cgColor
    }

    // MARK: - IBActions
    @IBAction private func loginWithGmailButtonTouchUpInside(_ sender: Any) {
        LoginService.login(controller: self) { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success:
                AppDelegate.shared.setroot(with: .tabbar)
            case .failure(let error):
                this.alert(title: "Error", msg: error.localizedDescription, handler: nil)
            }
        }
    }
}

import UIKit
import GoogleSignIn

@available(iOS 13.0, *)
final class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var loginFacebookButton: UIButton!
    @IBOutlet private weak var loginGmailButton: UIButton!

    let signInConfig = GIDConfiguration.init(clientID: "1067897935402-urdpk47r6q9m58tbj9c5ed0mn7ck5un0.apps.googleusercontent.com")

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

    @IBAction private func googleLogin(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            AppDelegate.shared.setroot(with: .tabbar)
        }
    }
}

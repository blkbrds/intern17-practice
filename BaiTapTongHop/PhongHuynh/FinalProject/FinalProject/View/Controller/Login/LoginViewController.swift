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

    // MARK: - IBActions
    @IBAction private func loginWithGmailButtonTouchUpInside(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            if error != nil || user == nil {
                // Show the app's signed-out state.
            } else {
                AppDelegate.shared.setroot(with: .tabbar)
                // Save to userdefault
                UserDefaults.standard.setValue(user?.profile?.name, forKey: "user_name")
                UserDefaults.standard.setValue(user?.profile?.imageURL(withDimension: 320)?.absoluteString, forKey: "image")
            }
        }
    }
}

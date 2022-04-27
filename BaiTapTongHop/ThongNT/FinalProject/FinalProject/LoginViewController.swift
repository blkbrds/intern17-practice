//
//  LoginViewController.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/20/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import GoogleAPIClientForREST
import GoogleSignIn
import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    private let scopes = [kGTLRAuthScopeYouTubeReadonly,
                          kGTLRAuthScopeYouTubeForceSsl]

    private let service = GTLRYouTubeService()
    let signInButton = GIDSignInButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure Google Sign-in.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        GIDSignIn.sharedInstance().signInSilently()

        // Add the sign-in button.
        view.addSubview(signInButton)
        signInButton.center = UIScreen.main.bounds.mid

        // Add hud when loading API
        var hudFrame = CGRect(origin: .zero, size: CGSize(width: 50, height: 50))
        let hud = NVActivityIndicatorView(frame: hudFrame, type: .ballBeat, color: .green, padding: 0)
        hud.center = UIScreen.main.bounds.mid
        view.addSubview(hud)
        hud.startAnimating()
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            showAlert(title: "Authentication Error", message: error.localizedDescription)
            self.service.authorizer = nil
        } else {
            self.signInButton.isHidden = true
            guard GIDSignIn.sharedInstance().currentUser != nil,
                  let accessToken = GIDSignIn.sharedInstance().currentUser.authentication.accessToken else {
                return
            }
            SceneDelegate.shared.accsesToken = accessToken
            SceneDelegate.shared.setRootView(with: .logined)
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

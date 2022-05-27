//
//  LoginService.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/27/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import GoogleSignIn

@available(iOS 13.0, *)
final class LoginService {

    class func login(controller: UIViewController, completion: @escaping APICompletion) {
        GIDSignIn.sharedInstance.signIn(with: AppDelegate.shared.signInConfig, presenting: controller) { user, error in
            if let error = error {
                completion(.failure(error))
            } else {
                UserDefaults.standard.setValue(user?.profile?.name, forKey: "user_name")
                UserDefaults.standard.setValue(user?.profile?.imageURL(withDimension: 320)?.absoluteString, forKey: "image")
                completion(.success)
            }
    }
}
}

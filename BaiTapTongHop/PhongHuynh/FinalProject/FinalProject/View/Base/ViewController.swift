//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import MVVM
import SwiftUtils

class BaseViewController: UIViewController, MVVM.View {

    // Conformance for ViewEmptyProtocol
    var isViewEmpty: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.accessibilityIdentifier = String(describing: type(of: self))
        view.removeMultiTouch()
    }

    var navigationBarColor: UIColor? {
        didSet {
            if #available(iOS 15.0, *) {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundColor = UIColor.black
                navigationController?.navigationBar.standardAppearance = appearance
                navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            } else {
                navigationController?.navigationBar.barTintColor = UIColor.black
            }
        }
    }
}

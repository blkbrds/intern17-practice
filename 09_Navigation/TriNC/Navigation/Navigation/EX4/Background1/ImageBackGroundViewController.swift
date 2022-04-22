//
//  ImageBackGroundViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class ImageBackGroundViewController: UIViewController {
    
    //     MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gradient Background"
        // iOS 15.4 cannot setbackground img
        let img = UIImage(named: "ic-gradient")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
    }
}


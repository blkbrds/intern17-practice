//
//  Bai4p3ViewController.swift
//  Navigation
//
//  Created by Tinh Bui T. VN.Danang on 5/11/22.
//

import UIKit

final class Bai4p3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gradient NavigationBar"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let gradientLayer = CAGradientLayer()
          var updatedFrame = self.navigationController!.navigationBar.bounds
          updatedFrame.size.height += UIApplication.shared.statusBarFrame.size.height
          gradientLayer.frame = updatedFrame
          gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
          gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
          gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
          UIGraphicsBeginImageContext(gradientLayer.bounds.size)
          gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
          let image = UIGraphicsGetImageFromCurrentImageContext()
          UIGraphicsEndImageContext()
          self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)

    }



}

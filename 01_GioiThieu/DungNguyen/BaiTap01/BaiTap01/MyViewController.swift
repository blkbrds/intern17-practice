//
//  MyViewController.swift
//  BaiTap01
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/7/22.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
    }
    
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red: CGFloat = CGFloat(drand48())
         let green: CGFloat = CGFloat(drand48())
         let blue: CGFloat = CGFloat(drand48())

         return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    @IBAction func btTap(_ sender: Any) {
        self.view.backgroundColor = getRandomColor()
    }
}

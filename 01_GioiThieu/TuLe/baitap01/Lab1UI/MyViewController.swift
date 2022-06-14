//
//  MyViewController.swift
//  Lab1UI
//
//  Created by tu.le2 on 07/06/2022.
//

import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }

    @IBAction func TouchButton(_ sender: Any) {
        view.backgroundColor = getRandomColor()
    }
}

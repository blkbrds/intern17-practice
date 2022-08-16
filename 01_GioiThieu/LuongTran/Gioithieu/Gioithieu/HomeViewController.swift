//
//  HomeViewController.swift
//  Gioithieu
//
//  Created by luong.tran on 16/08/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnTap: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = getRandomColor()
        btnTap.backgroundColor = .clear
        btnTap.layer.cornerRadius = 5
        btnTap.layer.borderWidth = 1
        btnTap.layer.borderColor = UIColor.black.cgColor
    }

    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    @IBAction func tapChangeColor(_ sender: Any) {
        self.view.backgroundColor = getRandomColor()
    }
    

}

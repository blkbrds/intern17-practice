//
//  MyViewController.swift
//  BaiTap01
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/7/22.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }
    func randomColor() -> UIColor
    {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())

             return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    @IBAction func button(_ sender: Any) {
        self.view.backgroundColor = randomColor()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

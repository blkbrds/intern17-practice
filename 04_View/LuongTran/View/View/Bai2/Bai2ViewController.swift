//
//  Bai2ViewController.swift
//  View
//
//  Created by luong.tran on 19/08/2022.
//

import UIKit

class Bai2ViewController: UIViewController {
    
    var arrayName: [String] = ["Person 1", "Person 2", "Person 3", "Person 4", "Person 5", "Person 6", "Person 7", "Person 8", "Person 9"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configUserUI()
    }
    
    func configUserUI(){
        
        let width: CGFloat = CGFloat((UIScreen.main.bounds.width - 60) / 3)
        let height: CGFloat = CGFloat((UIScreen.main.bounds.width) / 3)
        let space = 15

        for i in 0..<arrayName.count{
            let x1: CGFloat = CGFloat(space * (i + 1))
            let x2: CGFloat = width * CGFloat(i)
            var x: CGFloat = x1 + x2
            var y: CGFloat = 100
            if x >= UIScreen.main.bounds.width {
                let x1 = CGFloat(i % 3) * width
                let x2 = CGFloat(((i % 3) + 1) ) * CGFloat(space)
                x = x1 + x2
                y = CGFloat(y) * (CGFloat(Float(i / 3)) + 1) + height * CGFloat(i / 3)
            }
            
            let myView = ViewUser(frame: CGRect(x: x, y: y, width: width, height: height))
            myView.userName?.text = arrayName[i]
            myView.userAvatar?.image = UIImage(systemName: "person.fill")
            view.addSubview(myView)
        }
    }
    

}

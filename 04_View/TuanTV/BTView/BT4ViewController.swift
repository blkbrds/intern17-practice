//
//  BT4ViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/25/22.
//

import UIKit

final class BT4ViewController: UIViewController {
    let arrButtons = ["1", "2", "3", "+", "4", "5", "6","-","7", "8", "9", "x", "AC", "0", "=", ":"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        let viewDisplay = UIView(frame: CGRect(x: 50, y: 50, width: view.frame.width - 100, height: 60))
        viewDisplay.layer.borderWidth = 1
        viewDisplay.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        view.addSubview(viewDisplay)
        let lbDisplay = UILabel(frame: CGRect(x: 60, y: 50, width: view.frame.width - 120, height: 60))
        lbDisplay.text = "0"
        lbDisplay.textAlignment = .right
        lbDisplay.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(lbDisplay)
        
        let viewKeyboard = UIView(frame: CGRect(x: 50, y: 200, width: view.frame.width - 100 , height: view.frame.width - 100))
        
        view.addSubview(viewKeyboard)
        
        var x = 0
        var y = 0
        let spaceHorizontal = (viewKeyboard.frame.width - CGFloat(4 * 50)) / 3
        let spaceVertical = spaceHorizontal
    
        for i in 0...3 {
            for j in 0...3 {
                let btn = UIButton(frame: CGRect(x: x, y: y, width: 50, height: 50))
                btn.backgroundColor = .red
                btn.setTitle(arrButtons[4 * i + j], for: .normal)
                btn.setTitleColor(.black, for: .normal)
                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
                
                switch arrButtons[4 * i + j] {
                case "1", "2", "3", "4", "5", "6", "7", "8", "9":
                    btn.backgroundColor = .blue
                case "+", "-", "x", ":":
                    btn.backgroundColor = .white
                case "AC":
                    btn.backgroundColor = .orange
                case "=":
                    btn.backgroundColor = .green
                default:
                    break
                }
                
                viewKeyboard.addSubview(btn)
                x = x + 50 + Int(spaceHorizontal)
            }
            x = 0
            y = y + 50 + Int(spaceVertical)
        }
    }
    
    

}

//
//  BT4XViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/28/22.
//

import UIKit

class BT4XViewController: UIViewController {
    let lbColor = UILabel()
    let vColor = UIView()
    let lbRed = UILabel()
    let sldRed = UISlider()
    let lbGreen = UILabel()
    let sldGreen = UISlider()
    let lbBlue = UILabel()
    let sldBlue = UISlider()
    
    var redValue = 0
    var greenValue = 0
    var blueValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addActionToSlider()

        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        let widthView = view.frame.width
        let heightView = view.frame.height
        lbColor.frame = CGRect(x: 20, y: 20, width: widthView - 40, height: 40)
        lbColor.textAlignment = .center
        lbColor.backgroundColor = .red
        view.addSubview(lbColor)
        
        vColor.frame = CGRect(x: 20, y: 70, width: widthView - 40, height: heightView / 2)
        vColor.backgroundColor = .blue
        vColor.layer.cornerRadius = 20
        view.addSubview(vColor)
        
        lbRed.frame = CGRect(x: 20, y: 70 + heightView / 2 + 10, width: 60, height: 40)
        lbRed.textAlignment = .right
        lbRed.text = "Red"
        view.addSubview(lbRed)
        
        sldRed.frame = CGRect(x: 90, y: 70 + heightView / 2 + 10, width: widthView - 110, height: 40)
        view.addSubview(sldRed)
        
        lbGreen.frame = CGRect(x: 20, y: 70 + heightView / 2 + 50, width: 60, height: 40)
        lbGreen.textAlignment = .right
        lbGreen.text = "Green"
        view.addSubview(lbGreen)
        
        sldGreen.frame = CGRect(x: 90, y: 70 + heightView / 2 + 50, width: widthView - 110, height: 40)
        view.addSubview(sldGreen)
        
        lbBlue.frame = CGRect(x: 20, y: 70 + heightView / 2 + 100, width: 60, height: 40)
        lbBlue.textAlignment = .right
        lbBlue.text = "Blue"
        view.addSubview(lbBlue)
        
        sldBlue.frame = CGRect(x: 90, y: 70 + heightView / 2 + 100, width: widthView - 110, height: 40)
        view.addSubview(sldBlue)
        
    }
    
    func addActionToSlider() {
        sldRed.addTarget(self, action: #selector(valueChanged(sender:)), for: .valueChanged)
        sldGreen.addTarget(self, action: #selector(valueChanged(sender:)), for: .valueChanged)
        sldBlue.addTarget(self, action: #selector(valueChanged(sender:)), for: .valueChanged)
        
    }
    
    @objc func valueChanged(sender : UISlider) {
        switch sender {
        case sldRed:
            redValue = Int(sldRed.value * 255)
            vColor.backgroundColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
        case sldGreen:
            greenValue = Int(sldGreen.value * 255)
            vColor.backgroundColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
        case sldBlue:
            blueValue  = Int(sldBlue.value * 255)
            vColor.backgroundColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
        default:
            break
        }
    }

}

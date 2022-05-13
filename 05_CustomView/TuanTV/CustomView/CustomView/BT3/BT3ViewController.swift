//
//  BT3ViewController.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/10/22.
//

import UIKit

final class BT3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let widthView: CGFloat = view.frame.width
        let widthCustomButton: CGFloat = 260
        let heightCustomButton: CGFloat = 100
        let customButton1 = Bundle.main.loadNibNamed("CustomButton", owner: self, options: nil)?[0] as? CustomButton
        customButton1?.frame = CGRect(x: widthView / 2 - widthCustomButton / 2, y: 50, width: widthCustomButton, height: heightCustomButton)
        customButton1?.button.backgroundColor = .green
        customButton1?.button.setTitle("Email", for: .normal)
        customButton1?.button.layer.cornerRadius = 10
        customButton1?.badgeLabel.backgroundColor = .red
        customButton1?.badgeTitle = "10"
        customButton1?.badgePosition = .TopRight
        customButton1?.badgeLabel.layer.cornerRadius = 6
        customButton1?.badgeLabel.layer.masksToBounds = true
        view.addSubview(customButton1!)
        
        let customButton2 = Bundle.main.loadNibNamed("CustomButton", owner: self, options: nil)?[0] as? CustomButton
        customButton2?.frame = CGRect(x: widthView / 2 - widthCustomButton / 2, y: 150, width: widthCustomButton, height: heightCustomButton)
        customButton2?.button.backgroundColor = .green
        customButton2?.button.setTitle("Friends", for: .normal)
        customButton2?.button.layer.cornerRadius = 10
        customButton2?.badgeLabel.backgroundColor = .red
        customButton2?.badgeTitle = "1000"
        customButton2?.badgePosition = .TopLeft
        customButton2?.badgeLabel.layer.cornerRadius = 6
        customButton2?.badgeLabel.layer.masksToBounds = true
        view.addSubview(customButton2!)
        
        let customButton3 = Bundle.main.loadNibNamed("CustomButton", owner: self, options: nil)?[0] as? CustomButton
        customButton3?.frame = CGRect(x: widthView / 2 - widthCustomButton / 2, y: 250, width: widthCustomButton, height: heightCustomButton)
        customButton3?.button.backgroundColor = .green
        customButton3?.button.setTitle("Photos", for: .normal)
        customButton3?.button.layer.cornerRadius = 10
        customButton3?.badgeLabel.backgroundColor = .red
        customButton3?.badgeTitle = "1"
        customButton3?.badgePosition = .BottomCenter
        customButton3?.badgeLabel.layer.cornerRadius = 6
        customButton3?.badgeLabel.layer.masksToBounds = true
        view.addSubview(customButton3!)
    }
}

enum BadgePosition {
    case TopLeft
    case TopRight
    case TopCenter
    case CenterLeft
    case CenterRight
    case BottomLeft
    case BottomCenter
    case BottomRight
}

extension BT2ViewController {
    var a : Int {
        return 1
    }
}


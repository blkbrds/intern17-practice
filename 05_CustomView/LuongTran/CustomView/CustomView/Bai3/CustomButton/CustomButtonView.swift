//
//  CustomButtonView.swift
//  CustomView
//
//  Created by luong.tran on 24/08/2022.
//

import UIKit

class CustomButtonView: UIView {

    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var btnFriend: UIButton!
    @IBOutlet weak var friendView: UIView!
    @IBOutlet weak var lbFriend: UILabel!
    
    @IBOutlet weak var btnPhoto: UIButton!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var lbPhoto: UILabel!

    var position: BadgeButtonView = .bottomMid

    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
        checkBadge()
        
        updateUI()
        
    }
    
    func configUI(){
        btnEmail.layer.cornerRadius = 10
        btnFriend.layer.cornerRadius = 10
        btnPhoto.layer.cornerRadius = 10
        lbEmail.layer.cornerRadius = 20
        
        lbEmail.text = "8"
        lbPhoto.text = "90+"
        lbFriend.text = "990+"
    }
    
    func checkBadge(){
        if lbPhoto.text == "0"{
            lbPhoto.isHidden = true
        }
        if lbEmail.text == "0" {
            lbEmail.isHidden = true
        }
        if lbFriend.text == "0"{
            lbFriend.isHidden = true
        }
    }
    
    enum BadgeButtonView{
        case topLeft
        case topMid
        case topRight
        case midLeft
        case midRight
        case bottomRight
        case bottomMid
        case bottomLeft

        func test(minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) -> CGRect {
            switch self {
            case .topLeft:
                return CGRect(origin: CGPoint(x: minY - minX, y: minX), size: CGSize(width: 40, height: 30))
            case .topMid:
                return CGRect(origin: CGPoint(x: (maxX - minX) / 2, y: minX), size: CGSize(width: 40, height: 30))
            case .topRight:
                return CGRect(origin: CGPoint(x: maxX - minX, y: minX), size: CGSize(width: 40, height: 30))
            case .midLeft:
                return CGRect(origin: CGPoint(x: minY - minX, y: maxY / 2), size: CGSize(width: 40, height: 30))
            case .midRight:
                return CGRect(origin: CGPoint(x: maxX - minX, y: maxY / 2), size: CGSize(width: 40, height: 30))
            case .bottomRight:
                return CGRect(origin: CGPoint(x: maxX - minX, y: maxY - minY / 2), size: CGSize(width: 40, height: 30))
            case .bottomMid:
                return CGRect(origin: CGPoint(x: (maxX - minX) / 2, y: maxY - minY / 2), size: CGSize(width: 40, height: 30))
            case .bottomLeft:
                return CGRect(origin: CGPoint(x: minY - minX, y: maxY - minX), size: CGSize(width: 40, height: 30))
            }
        }
    }

    func updateUI() {
        lbEmail.frame = position.test(minX: btnEmail.frame.minX, maxX: btnEmail.frame.maxX, minY: btnEmail.frame.minY, maxY: btnEmail.frame.maxY)
        lbFriend.frame = position.test(minX: btnEmail.frame.minX, maxX: btnEmail.frame.maxX, minY: btnEmail.frame.minY, maxY: btnEmail.frame.maxY)
        lbPhoto.frame = position.test(minX: btnEmail.frame.minX, maxX: btnEmail.frame.maxX, minY: btnEmail.frame.minY, maxY: btnEmail.frame.maxY)
    }
    
}

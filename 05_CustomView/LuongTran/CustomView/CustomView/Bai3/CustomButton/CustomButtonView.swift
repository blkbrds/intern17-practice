//
//  CustomButtonView.swift
//  CustomView
//
//  Created by luong.tran on 24/08/2022.
//

import UIKit

final class CustomButtonView: UIView {
    
    var position: BadgeButtonView = .bottomLeft

    @IBOutlet private weak var btnEmail: UIButton!
    @IBOutlet private weak var lbEmail: UILabel!
    @IBOutlet private weak var emailView: UIView!
    
    @IBOutlet private weak var btnFriend: UIButton!
    @IBOutlet private weak var friendView: UIView!
    @IBOutlet private weak var lbFriend: UILabel!
    
    @IBOutlet private weak var btnPhoto: UIButton!
    @IBOutlet private weak var photoView: UIView!
    @IBOutlet private weak var lbPhoto: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
        checkBadge()
        updateUI()
    }

    private func configUI() {
        lbEmail.layer.cornerRadius = Define.cornerRadius10
        lbFriend.layer.cornerRadius = Define.cornerRadius10
        lbPhoto.layer.cornerRadius = Define.cornerRadius10
        
        lbEmail.text = "8"
        lbPhoto.text = "90+"
        lbFriend.text = "990+"
    }
    
    private func checkBadge() {
        lbPhoto.isHidden = lbPhoto.text == "0"
        lbEmail.isHidden = lbEmail.text == "0"
        lbFriend.isHidden = lbFriend.text == "0"
    }
    
    enum BadgeButtonView {
        case topLeft
        case topMid
        case topRight
        case midLeft
        case midRight
        case bottomRight
        case bottomMid
        case bottomLeft

        func positionBadge(minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) -> CGRect {
            
            let positionXLeft = minY - minX
            let positionXMid = (maxX - minX) / 2
            let positionXRight = maxX - minX
            
            let postitionYTop = minY
            let positionYMid = maxY / 2
            let positionYBottom = maxY - minY / 2
            
            switch self {
            case .topLeft:
                return CGRect(origin: CGPoint(x: positionXLeft, y: postitionYTop), size: Define.size)
            case .midLeft:
                return CGRect(origin: CGPoint(x: positionXLeft, y: positionYMid), size: Define.size)
            case .bottomLeft:
                return CGRect(origin: CGPoint(x: positionXLeft, y: positionYBottom), size: Define.size)
            case .topMid:
                return CGRect(origin: CGPoint(x: positionXMid, y: postitionYTop), size: Define.size)
            case .bottomMid:
                return CGRect(origin: CGPoint(x: positionXMid, y: positionYBottom), size: Define.size)
            case .topRight:
                return CGRect(origin: CGPoint(x: positionXRight, y: postitionYTop), size: Define.size)
            case .midRight:
                return CGRect(origin: CGPoint(x: positionXRight, y: positionYMid), size: Define.size)
            case .bottomRight:
                return CGRect(origin: CGPoint(x: positionXRight, y: positionYBottom), size: Define.size)
            }
        }
    }

    private func updateUI() {
        lbEmail.frame = position.positionBadge(minX: btnEmail.frame.minX, maxX: btnEmail.frame.maxX, minY: btnEmail.frame.minY, maxY: btnEmail.frame.maxY)
        lbFriend.frame = position.positionBadge(minX: btnEmail.frame.minX, maxX: btnEmail.frame.maxX, minY: btnEmail.frame.minY, maxY: btnEmail.frame.maxY)
        lbPhoto.frame = position.positionBadge(minX: btnEmail.frame.minX, maxX: btnEmail.frame.maxX, minY: btnEmail.frame.minY, maxY: btnEmail.frame.maxY)
    }
    
}

extension CustomButtonView {
    private struct Define {
        static let cornerRadius10: CGFloat = 10
        static let cornerRadius20: CGFloat = 20
        static let size: CGSize = CGSize(width: 40, height: 30)
    }
}

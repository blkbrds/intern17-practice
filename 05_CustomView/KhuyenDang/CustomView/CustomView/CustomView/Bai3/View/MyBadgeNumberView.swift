//
//  MyBadgeNumberView.swift
//  CustomView
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/21/22.
//

import UIKit

final class MyBadgeNumberView: UIView {

    //MARK: - IBOutlets
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var badgeNumberView: UIView!
    @IBOutlet private weak var contentButton: UIButton!

    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        contentButton.layer.cornerRadius = 15
        badgeNumberView.layer.cornerRadius = 15
    }

    //MARK: - Properties
    enum badgeLocation {
        case topLeft
        case topRight
        case topCenter
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomRight
        case bottomCenter
    }

    enum typeContentButton {
        case email
        case friends
        case photos
    }

    var typeBadgeLocation: badgeLocation = .topLeft {
        didSet {
            setBadgeLocation()
        }
    }

    var number: Int = 0 {
        didSet {
            updateBadgeView()
        }
    }

    var valueTypeContentButton: typeContentButton = .email {
        didSet {
            updateContentButton()
        }
    }
    // MARK: - Private funcs
    private func updateContentButton() {
        switch valueTypeContentButton {
        case .email :
            contentButton.setTitle("Emai", for: .normal)
            contentButton.backgroundColor = .green
        case .friends:
            contentButton.setTitle("Friends", for: .normal)
            contentButton.backgroundColor = .yellow
        case .photos:
            contentButton.setTitle("Photos", for: .normal)
            contentButton.backgroundColor = .purple
        }
    }

    private func updateBadgeView() {
        var widthLabel: CGFloat = 0.0
        switch number {
        case 0 :
            badgeNumberView.isHidden = true
        case 1...9:
            valueLabel.text = "\(number)"
            widthLabel = (valueLabel.text ?? "50").width(constraintedWidth: 40, font: valueLabel.font) + 10
        case 10...99:
            valueLabel.text = "\(number)"
            widthLabel = (valueLabel.text ?? "50").width(constraintedWidth: 40, font: valueLabel.font) + 20
        default:
            valueLabel.text = "99+"
            widthLabel = (valueLabel.text ?? "50").width(constraintedWidth: 40, font: valueLabel.font) + 35
        }
        valueLabel.center = CGPoint(x: widthLabel / 2, y: badgeNumberView.frame.size.height / 2)
        badgeNumberView.bounds.size.width = widthLabel
    }

    private func setBadgeLocation() {
        switch typeBadgeLocation {
        case .topLeft:
            badgeNumberView.center.x = 0
            badgeNumberView.center.y = 0
        case .topRight:
            badgeNumberView.center.x = contentButton.frame.width
            badgeNumberView.center.y = 0
        case .topCenter:
            badgeNumberView.center.x = contentButton.frame.size.width / 2
            badgeNumberView.center.y = 0
        case .centerLeft:
            badgeNumberView.center.x = 0
            badgeNumberView.center.y = contentButton.frame.size.height / 2
        case .centerRight:
            badgeNumberView.center.x = contentButton.frame.width
            badgeNumberView.center.y = contentButton.frame.size.height / 2
        case .bottomLeft:
            badgeNumberView.center.x = 0
            badgeNumberView.center.y = contentButton.frame.size.height
        case .bottomRight:
            badgeNumberView.center.x = contentButton.frame.width
            badgeNumberView.center.y = contentButton.frame.height
        default:            //bottom center
            badgeNumberView.center.x = contentButton.frame.size.width / 2
            badgeNumberView.center.y = contentButton.frame.size.height
        }
    }
}

// Tính độ rộng của chữ
extension String {
    func width(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        return label.frame.height
    }
}

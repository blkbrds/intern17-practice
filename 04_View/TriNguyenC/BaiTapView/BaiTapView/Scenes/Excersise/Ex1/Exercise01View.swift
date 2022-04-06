//
//  Exercise01View.swift
//  BaiTapView
//
//  Created by tri.nguyen on 05/04/2022.
//

import Foundation
import UIKit

final class Exercis01View: UIView {
    
    // MARK: - Properties
    var name: String? {
        didSet {
            updateUI()
        }
    }
    
    var avatar: String? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Outlet
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var markButton: UIButton!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Actions
    @IBAction func MarkButtonTouchUpInside(_ sender: Any) {
        print("tap tap tap")
    }
    
    // MARK: - Private Function
    private func updateUI() {
        nameLabel.text = name
        avatarImageView.image = UIImage(named: avatar ?? "")
    }
}

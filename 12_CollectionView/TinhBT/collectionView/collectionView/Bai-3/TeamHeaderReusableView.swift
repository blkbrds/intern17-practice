//
//  TeamHeaderReusableView.swift
//  collectionView
//
//  Created by Tinh Bui T. VN.Danang on 5/27/22.
//

import UIKit

final class TeamHeaderReusableView: UICollectionReusableView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var teamAvatarImageView: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var teamNameLabelLeadingConstraint: NSLayoutConstraint!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        teamAvatarImageView.layer.cornerRadius = 30
        teamAvatarImageView.clipsToBounds = true
    }
    
    // MARK: - Functions
    func updateHeaderView(avatar: UIImage, name: String, status: Status) {
        teamAvatarImageView.image = avatar
        teamNameLabel.text = name
        updateHeaderView(status: status)
    }
    
    func updateHeaderView(status: Status) {
        switch status {
        case .standard:
            teamAvatarImageView.isHidden = false
            teamNameLabelLeadingConstraint.constant = 80            
        case .small:
            teamAvatarImageView.isHidden = true
            teamNameLabelLeadingConstraint.constant = 10
        }
    }
}

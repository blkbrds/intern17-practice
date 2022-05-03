//
//  TeamHeaderReusableView.swift
//  CollectionView
//
//  Created by tri.nguyen on 03/05/2022.
//

import UIKit

final class TeamHeaderReusableView: UICollectionReusableView {

    // MARK: - IBOutlet
    @IBOutlet weak var teamAvatarImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        teamAvatarImageView.layer.cornerRadius = 12
        teamAvatarImageView.clipsToBounds = true
    }
    
    // MARK: - Public Function
    func updateHeaderView(avatar: UIImage, name: String) {
        teamAvatarImageView.image = avatar
        teamNameLabel.text = name
    }
}

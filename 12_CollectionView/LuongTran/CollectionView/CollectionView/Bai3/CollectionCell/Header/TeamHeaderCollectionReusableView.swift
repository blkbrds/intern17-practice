//
//  TeamHeaderCollectionReusableView.swift
//  CollectionView
//
//  Created by luong.tran on 20/09/2022.
//

import UIKit

final class TeamHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet private weak var teamAvatarImageView: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamNameLabelLeadingContraint: NSLayoutConstraint!
    
    var viewModel: TeamHeaderCellViewModel? {
        didSet {
            updateHeaderView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        teamAvatarImageView.layer.cornerRadius = 10
        teamAvatarImageView.clipsToBounds = true
    }
    
    func updateHeaderView() {
        guard let viewModel = viewModel else { return }
        teamAvatarImageView.image = viewModel.avatar
        teamNameLabel.text = viewModel.name
        updateHeaderView(status: viewModel.status)
    }
    
    func updateHeaderView(status: Status) {
        switch status {
        case .standard:
            teamAvatarImageView.isHidden = false
            teamNameLabelLeadingContraint.constant = 80
        case .small:
            teamAvatarImageView.isHidden = true
            teamNameLabelLeadingContraint.constant = 10
        }
    }
    
}

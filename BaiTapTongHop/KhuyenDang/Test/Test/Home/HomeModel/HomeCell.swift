//
//  HomeCell.swift
//  Test
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/20/22.
//

import UIKit

// MARK: - Protocol
protocol HomeCellDelegate: AnyObject {
    func cell(_ cell: HomeCell, needPerformAction action: HomeCell.Action)
}

final class HomeCell: UITableViewCell {
    
    // MARK: - Enum
    enum Action {
        case updatedUser
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var detailButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: HomeCellDelegate?
    var viewModel: HomeCellViewModel? {
        didSet {
            updateCell()
        }
    }
    
    // MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = 30
    }
    
    // MARK: - Private func
    private func updateCell() {
        guard let viewModel = viewModel else {
            return
        }
        nameLabel.text = viewModel.user.name
        dateLabel.text = viewModel.user.birthday
        avatarImageView.image = UIImage(named: viewModel.user.avatarImage)
    }
    
    // MARK: - IBActions
    @IBAction private func detailButtonTouchUpInside(_ sender: Any) {
        delegate?.cell(self, needPerformAction: .updatedUser)
    }
}

//
//  HomeCell.swift
//  Test
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/20/22.
//

import UIKit

// MARK: - Protocol
protocol HomeCellDelegate : AnyObject {
    func cell(_ cell: HomeCell,  needPerformAction action: HomeCell.Action)
}

final class HomeCell: UITableViewCell {
    
    // MARK: - Define
    enum Action {
        case updateUser
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var birthdayLabel: UILabel!
    @IBOutlet private weak var forwardButton: UIButton!
    
    // MARK: - Properties
    var viewModel: HomeCellViewModel? {
        didSet {
            updateTableCell()
        }
    }
    weak var delegate: HomeCellDelegate?
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImage.layer.cornerRadius = 50
        avatarImage.layer.borderWidth = 0.5
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private function
    private func updateTableCell() {
        guard let viewModel = viewModel else { return }
        avatarImage.image = UIImage(named: viewModel.user.avatar ?? "")
        nameLabel.text = viewModel.user.name
        birthdayLabel.text = viewModel.user.birthday
    }
    
    // MARK: - IBAction
    @IBAction private func forwardButtonTouchUpInside(_ sender: UIButton) {
        delegate?.cell(self, needPerformAction: .updateUser)
    }
}

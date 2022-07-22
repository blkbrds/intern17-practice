//
//  HomeTableViewCell.swift
//  ThucHanh
//
//  Created by tu.le2 on 20/07/2022.
//

import UIKit

protocol HomeTableViewCellDelegate: AnyObject {
    func cell(cell: HomeTableViewCell, needPerform action: HomeTableViewCell.Action)
}

final class HomeTableViewCell: UITableViewCell {
    
    enum Action{
        case detailButtonPressed
    }
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var birthdayLabel: UILabel!
    @IBOutlet private weak var detailButton: UIButton!
    @IBOutlet private weak var userImage: UIImageView!
    
    weak var delegate: HomeTableViewCellDelegate?
    var viewModel: HomeTableCellViewModel? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
    
    private func configUI() {
        userImage.layer.cornerRadius = userImage.frame.width / 1.6
    }
    
    private func updateCell() {
        guard let viewModel = viewModel else {
            return
        }
        
        nameLabel.text = viewModel.user.name
        birthdayLabel.text = viewModel.user.birthday
    }
    
    @IBAction private func detailButtonTouchUpInside(_ sender: UIButton) {
        delegate?.cell(cell: self, needPerform: .detailButtonPressed)
    }
}

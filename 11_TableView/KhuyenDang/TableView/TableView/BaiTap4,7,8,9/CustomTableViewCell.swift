//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/6/22.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func cell(_ cell: CustomTableViewCell, needPerformAction action: CustomTableViewCell.Action)
}

struct InfoCell {
    var avatar: String = ""
    var name: String = ""
    var subtitle: String = "Name"
    var index: Int = -1
    var section: String = ""
}
final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var customCellLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var tapMeButton: UIButton!
    
    // MARK: - Properties
    enum Action {
        case passIndexTap(index: Int, section: String)
    }
    var sections: String = ""
    weak var delegate: CustomTableViewCellDelegate?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        tapMeButton.addTarget(self, action: #selector(tapMeButtonTouchUpInside(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Override
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    func updateTableCell(item: InfoCell) {
        avatarImageView.image = UIImage(named: item.avatar)
        nameLabel.text = item.name
        customCellLabel.text = item.subtitle
        sections = item.section
        tapMeButton.tag = item.index
    }
    
    // MARK: - Objc
    @objc private func tapMeButtonTouchUpInside(sender: UIButton) {
        delegate?.cell(self, needPerformAction: .passIndexTap(index: sender.tag, section: sections ))
    }
}


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

struct Model {
    var avatar: String = ""
    var name: String = ""
    var subtitle: String = "Name"
    var index: Int = -1
    var section: String = ""
}
final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var customCellLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tapMeButton: UIButton!
    
    // MARK: - Properties
    enum Action {
        case passIndexTap(index: Int, section: String)
    }
    var sections: String = ""
    weak var delegate: CustomTableViewCellDelegate?
    
    // MARK: - Override
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    func updateTableCell(item: Model) {
        avatarImageView.image = UIImage(named: item.avatar)
        nameLabel.text = item.name
        customCellLabel.text = item.subtitle
        sections = item.section
        tapMeButton.tag = item.index
        tapMeButton.addTarget(self, action: #selector(tapMeButtonTouchUpInside(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Objc
    @objc private func tapMeButtonTouchUpInside(sender: UIButton) {
        delegate?.cell(self, needPerformAction: .passIndexTap(index: sender.tag, section: sections ))
    }
}


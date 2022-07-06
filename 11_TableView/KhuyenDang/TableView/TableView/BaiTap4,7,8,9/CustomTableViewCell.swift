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
    
    // MARK: -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    func updateTableCell(avatar: String, name: String, subtitle: String = "Name", index: Int, section: String) {
        avatarImageView.image = UIImage(named: avatar)
        nameLabel.text = name
        customCellLabel.text = subtitle
        sections = section
        tapMeButton.tag = index
        tapMeButton.addTarget(self, action: #selector(tapMeButtonTouchUpInside(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Objc
    @objc func tapMeButtonTouchUpInside(sender: UIButton) {
        delegate?.cell(self, needPerformAction: .passIndexTap(index: sender.tag, section: sections ))
    }
}

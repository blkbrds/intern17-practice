//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/6/22.
//

import UIKit

// MARK: - Protocol
protocol CustomTableViewCellDelegate: AnyObject {
    func tapMe( _ customTableViewCell: CustomTableViewCell, index: Int, section: Int)
}

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var tapMeButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: CustomTableViewCellDelegate?
    var sections: Int = 0
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Function
    func updateTableCell(avatar: String, name: String = "", subtitle: String = "", index: Int, section: Int) {
        avatarImageView.image = UIImage(named: avatar)
        nameLabel.text = name
        subtitleLabel.text = subtitle
        tapMeButton.tag = index
        sections = section
        tapMeButton.addTarget(self, action: #selector(tapMeTouchUpInside), for: .touchUpInside)
    }
    
    // MARK: - Objc function
    @objc func tapMeTouchUpInside(sender: UIButton) {
        delegate?.tapMe(self, index: sender.tag, section: sections)
    }
}

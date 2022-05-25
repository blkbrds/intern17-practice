//
//  Bai9TableViewCell.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/23/22.
//

import UIKit

protocol Bai9TableViewCellDelegate: class {
    
    func tapMe(_ bai9TableViewCell: Bai9TableViewCell, needsPerfom actions: Bai9TableViewCell.Action)
}

final class Bai9TableViewCell: UITableViewCell {
    
    enum Action {
        case tap
    }

    // MARK: - IBOutlet
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var tapMeButton: UIButton!
    
    weak var delegate: Bai9TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTableCell(avatar: String, name: String = "", subTitle: String = "") {
        avatarImageView.image  = UIImage(named: avatar)
        nameLabel.text  = name
        subTitleLabel.text = subTitle
    }
    
    // MARK: - IBAction
    @IBAction private func tapButtonTouchUpInside(_ sender: Any) {
        if let delegate = delegate {
            delegate.tapMe(self, needsPerfom: .tap)
        }
    }
}

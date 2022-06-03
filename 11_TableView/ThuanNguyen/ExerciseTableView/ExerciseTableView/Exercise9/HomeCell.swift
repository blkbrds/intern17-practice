//
//  HomeCell.swift
//  ExerciseTableView
//
//  Created by thuan.nguyen on 24/05/2022.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLable: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

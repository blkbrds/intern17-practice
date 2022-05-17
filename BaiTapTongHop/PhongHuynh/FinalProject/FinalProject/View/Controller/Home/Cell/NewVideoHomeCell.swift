//
//  NewVideoHomeCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class NewVideoHomeCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var newVideoImageView: UIImageView!
    @IBOutlet private weak var titleNewVideLabel: UILabel!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//
//  HomeCell.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import UIKit

class HomeCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 48
        thumbnailImageView.layer.borderColor = UIColor.black.cgColor
        thumbnailImageView.layer.borderWidth = 1.5
        thumbnailImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Public Funtion
    func updateProfile(name: String, dateOfBirth: String) {
        nameLabel.text = name
        dateOfBirthLabel.text = dateOfBirth
    }
}

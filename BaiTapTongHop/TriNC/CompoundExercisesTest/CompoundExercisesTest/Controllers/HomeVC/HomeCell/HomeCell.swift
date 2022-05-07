//
//  HomeCell.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import UIKit

final class HomeCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateOfBirthLabel: UILabel!
    @IBOutlet private weak var detailButton: UIButton!
    
    // MARK: - Properties
    private var homeCellModel = HomeCellModel()
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 48
        thumbnailImageView.layer.borderColor = UIColor.black.cgColor
        thumbnailImageView.layer.borderWidth = 1.5
        thumbnailImageView.clipsToBounds = true
        fetchImage()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBAction
    @IBAction private func detailButtonTouchUpInside(_ sender: Any) {}
    
    // MARK: Public Funtion
    func updateProfile(name: String, date: String) {
        nameLabel.text = name
        dateOfBirthLabel.text = date
    }
    
    // MARK: Fetch Image
    func fetchImage() {
        homeCellModel.loadImage { image in
            if let image = image {
                self.thumbnailImageView.image = image
            }
        }
    }
}

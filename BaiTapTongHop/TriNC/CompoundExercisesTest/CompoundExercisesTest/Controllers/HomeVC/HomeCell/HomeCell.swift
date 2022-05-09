//
//  HomeCell.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import UIKit

// MARK: - Protocol
protocol HomeCellDelegate: class {
    func cell(_ cell: HomeCell, needsPerform action: HomeCell.Action)
}

final class HomeCell: UITableViewCell {
        
    // MARK: - IBOutlets
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateOfBirthLabel: UILabel!
    @IBOutlet private weak var detailButton: UIButton!
    
    // MARK: - Enum
    enum Action {
        case moveToDetail
    }
    
    // MARK: - Properties
    weak var delegate: HomeCellDelegate?
    private var homeCellViewModel = HomeCellViewModel()
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 48
        thumbnailImageView.layer.borderColor = UIColor.orange.cgColor
        thumbnailImageView.layer.borderWidth = 1
        thumbnailImageView.clipsToBounds = true
        fetchImage()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBAction
    @IBAction private func detailButtonTouchUpInside(_ sender: Any) {
        delegate?.cell(self, needsPerform: .moveToDetail)
    }
    
    // MARK: Public Funtion
    func updateProfile(name: String, date: String) {
        nameLabel.text = name
        dateOfBirthLabel.text = date
    }
    
    // MARK: Fetch Image
    private func fetchImage() {
        homeCellViewModel.loadImage { [weak self] image in
            if let image = image {
                self?.thumbnailImageView.image = image
            }
        }
    }
}

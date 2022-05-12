//
//  HomeCell.swift
//  TabbarController
//
//  Created by tri.nguyen on 11/05/2022.
//

import UIKit

final class HomeCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - UI
    private func updateView() {
        guard let viewModel = viewModel else {
            return
        }

        titleLabel.text = viewModel.music.name
        artistNameLabel.text = viewModel.music.artistName
        viewModel.loadImage(completion: { [weak self] in
            guard let this = self,
                  let imageData = viewModel.imageData else { return }
            let image = UIImage(data: imageData)
            this.thumbnailImageView.image = image
        })
    }
}

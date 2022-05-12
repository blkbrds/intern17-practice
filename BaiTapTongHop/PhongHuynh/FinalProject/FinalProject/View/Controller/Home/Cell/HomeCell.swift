//
//  HomeCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/12/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var nameYoutubeLabel: UILabel!
    @IBOutlet weak var youtubeImage: UIImageView!
    
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

    func updateView() {
        nameYoutubeLabel.text = viewModel?.video.title
        Networking.shared().downloadImage(url: viewModel?.video.imageURL ?? "") { (image) in
            self.youtubeImage.image = image
        }
    }
    
}

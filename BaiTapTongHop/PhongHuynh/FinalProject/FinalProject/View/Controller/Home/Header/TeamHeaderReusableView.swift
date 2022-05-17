//
//  TeamHeaderReusableView.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class TeamHeaderReusableView: UICollectionReusableView {

    // MARK: - IBOutlets
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var nextButton: UIButton!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

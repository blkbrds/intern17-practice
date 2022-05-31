//
//  ProfileCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import GoogleSignIn

// MARK: - ProfileCellDelegate
protocol ProfileCellDelegate: class {

    func cell(cell: ProfileCell, needsPerfom actions: ProfileCell.Action)
}

final class ProfileCell: UITableViewCell {

    // MARK: - Define
    enum Action {
        case cancel
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!

    // MARK: - Properties
    var viewModel: ProfileCellViewModel = ProfileCellViewModel()
    weak var delegate: ProfileCellDelegate?

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }

    private func configView() {
        nameLabel.text = UserDefaults.standard.string(forKey: "userName")
        viewModel.updateImageView(completion: { [weak self] (image) in
            guard let this = self else { return }
            this.userImageView.image = image
        })
    }

    // MARK: - IBActions
    @IBAction private func cancelButtonTouchUpInSide(_ sender: Any) {
        if let delegate = delegate {
            delegate.cell(cell: self, needsPerfom: .cancel)
        }
    }
}

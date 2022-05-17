//
//  NominationVideoCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/15/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class NominationVideoCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    var viewModel: NominationVideoCellViewModel? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    // MARK: - Private functions
    private func configCollectionView() {
        let nib = UINib(nibName: "NominationCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "NominationCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSourceUICollectionViewDataSource
extension NominationVideoCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NominationCell", for: indexPath) as? NominationCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel?.viewModelForItem(indexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension NominationVideoCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - (10 * 3)) / 2, height: 200)
        }
}

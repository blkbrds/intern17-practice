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
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NominationCell", for: indexPath) as? NominationCell else { return UICollectionViewCell() }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension NominationVideoCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - (10 * 4)) / 3, height: 200)
        }
}

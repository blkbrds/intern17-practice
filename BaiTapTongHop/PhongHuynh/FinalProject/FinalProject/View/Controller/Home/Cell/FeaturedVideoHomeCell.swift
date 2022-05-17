//
//  FeaturedVideoHomeCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class FeaturedVideoHomeCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

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
        let nib = UINib(nibName: "FeaturedCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "FeaturedCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSourceUICollectionViewDataSource
extension FeaturedVideoHomeCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCell", for: indexPath) as? FeaturedCell else { return UICollectionViewCell() }
        cell.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension FeaturedVideoHomeCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: UIScreen.main.bounds.width - 100, height: 200)
      }
}

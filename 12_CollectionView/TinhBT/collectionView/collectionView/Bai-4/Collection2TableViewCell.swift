//
//  Collection2TableViewCell.swift
//  collectionView
//
//  Created by Tinh Bui T. VN.Danang on 5/30/22.
//

import UIKit

final class Collection2TableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    // MARK: - Private functions
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension Collection2TableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

// MARK: - UICollectionViewDataSource
extension Collection2TableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
        cell2.backgroundColor = .blue
        return cell2
    }
}

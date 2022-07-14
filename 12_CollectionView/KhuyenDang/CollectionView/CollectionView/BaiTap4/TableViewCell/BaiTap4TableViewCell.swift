//
//  BaiTap4TableViewCell.swift
//  CollectionView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/7/22.
//

import UIKit

final class BaiTap4TableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configUICollectionView()
    }
    
    // MARK: - PRivate method
    private func configUICollectionView() {
        let nib = UINib(nibName: "BaiTap4CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK: - Extension
extension BaiTap4TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BaiTap4CollectionViewCell
        cell.updateCell(avatar: "icons8-avatar-64", name: "Khuyen")
        return cell
    }
}

extension BaiTap4TableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 30
        return CGSize(width: screenWidth/4, height: UIScreen.main.bounds.height / 6)
    }
}

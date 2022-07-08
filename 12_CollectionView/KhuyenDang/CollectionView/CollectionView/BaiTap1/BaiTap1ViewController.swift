//
//  BaiTap1ViewController.swift
//  CollectionView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/7/22.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUICollectionView()
    }
    
    // MARK: - Private method
    private func configUICollectionView() {
        let nib = UINib(nibName: "Bai1CustomCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
    }
}

// MARK: - Extension
extension BaiTap1ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Bai1CustomCollectionViewCell
        cell.updateCell(value: "\(indexPath.row + 1)")
        return cell
    }
}

extension BaiTap1ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 40
        return CGSize(width: screenWidth/5, height: screenWidth/5)
    }
}



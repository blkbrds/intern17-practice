//
//  Ex4CollectionCell.swift
//  CollectionView
//
//  Created by tri.nguyen on 06/05/2022.
//

import UIKit

final class HeaderCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var currentIndex: IndexPath = IndexPath(item: 0, section: 0) {
        didSet {
            currentIndex.row = (currentIndex.row < 0) ? 0 : (currentIndex.row > 11 ? 11 : currentIndex.row)
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    // MARK: - Private Function
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    // MARK: - IBActions
    @IBAction private func previousButtonTouchUpInside(_ sender: Any) {
        currentIndex.row -= 1
        collectionView.scrollToItem(at: currentIndex, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        currentIndex.row += 1
        collectionView.scrollToItem(at: currentIndex, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - Extention
extension HeaderCell: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Config.itemWidth - 20, height: Config.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

// MARK: - Config
extension HeaderCell {
    
    struct Config {
        static let itemWidth: CGFloat = UIScreen.main.bounds.width
        static let itemHeight: CGFloat = 200
    }
}



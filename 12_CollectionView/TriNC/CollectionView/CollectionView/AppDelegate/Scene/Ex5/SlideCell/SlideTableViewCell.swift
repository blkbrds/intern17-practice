//
//  SlideTableViewCell.swift
//  CollectionView
//
//  Created by tri.nguyen on 11/05/2022.
//

import UIKit

final class SlideTableViewCell: UITableViewCell {

    // MARK: - Outlet
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var previousButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: - Properties
    private var currentIndex: IndexPath = IndexPath(row: 0, section: 0) {
        didSet {
            currentIndex.row = (currentIndex.row < 0) ? 0 : (currentIndex.row > 11 ? 11 : currentIndex.row)
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private Function
    private func configUI() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    // MARK: - Actions
    @IBAction private func previousButtonTouchUpInside(_ sender: Any) {
        currentIndex.row -= 1
        collectionView.scrollToItem(at: currentIndex, at: .centeredHorizontally, animated: true)
    }
    
    
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        currentIndex.row += 1
        collectionView.scrollToItem(at: currentIndex, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - Extention  UICollectionViewDataSource && UICollectionViewDelegateFlowLayout
extension SlideTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}

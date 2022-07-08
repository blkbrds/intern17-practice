//
//  Bai3ViewController.swift
//  CollectionView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/7/22.
//

import UIKit

final class Avatar {
    var name: String
    var image: String
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

final class Bai3ViewController: UIViewController {
    
    // MARK: - IBOulet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var avatars: [[Avatar]] = [[Avatar(name: "Name", image: "avatar"), Avatar(name: "Name", image: "avatar")],
                               [Avatar(name: "Name", image: "avatar"), Avatar(name: "Name", image: "avatar"), Avatar(name: "Name", image: "avatar")],
                               [Avatar(name: "Name", image: "avatar"), Avatar(name: "Name", image: "avatar"), Avatar(name: "Name", image: "avatar"), Avatar(name: "Name", image: "avatar"), Avatar(name: "Name", image: "avatar")]]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    // MARK: - Private function
    private func configCollectionView() {
        let cellNib = UINib(nibName: "Bai3CollectionViewCell", bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
        let headerNib = UINib(nibName: "Bai3HeaderView", bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - Extensions
extension Bai3ViewController: UICollectionViewDelegate ,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return avatars.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatars[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Bai3CollectionViewCell
        cell.updateCell(avatar: avatars[indexPath.section][indexPath.row].image, name: avatars[indexPath.section][indexPath.row].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as!Bai3HeaderView
            header.updateHeader(section: "section \(indexPath.section + 1)")
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension Bai3ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 30
        return CGSize(width: screenWidth/3, height: (screenWidth/3) * 5 / 4)
    }
}

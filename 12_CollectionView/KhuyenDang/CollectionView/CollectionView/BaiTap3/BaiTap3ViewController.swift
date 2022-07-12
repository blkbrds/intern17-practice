//
//  BaiTap3ViewController.swift
//  CollectionView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/7/22.
//

import UIKit

final class BaiTap3ViewController: UIViewController {
    
    // MARK: - Class
    final class Avatar {
        var name: String
        var image: String
        init(name: String, image: String) {
            self.name = name
            self.image = image
        }
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var avatars: [[Avatar]] = [[Avatar(name: "Name", image: "avatarCute"), Avatar(name: "Name", image: "avatarCute")],
                               [Avatar(name: "Name", image: "avatarCute"), Avatar(name: "Name", image: "avatarCute"), Avatar(name: "Name", image: "avatarCute")]]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUICollectionView()
    }
    
    // MARK: - Private method
    func configUICollectionView() {
        let nib = UINib(nibName: "BaiTap3CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        let headerNib = UINib(nibName: "HeaderReusableView", bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderReusableView")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - Extension
extension BaiTap3ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        avatars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        avatars[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BaiTap3CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateCell(name: "\(avatars[indexPath.section][indexPath.row].name)", avatar: "\(avatars[indexPath.section][indexPath.row].image)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderReusableView", for: indexPath) as! HeaderReusableView
            header.updateHeader(value: "section \(indexPath.section + 1 )")
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension BaiTap3ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 30
        return CGSize(width: screenWidth/3, height: screenWidth/3)
    }
}

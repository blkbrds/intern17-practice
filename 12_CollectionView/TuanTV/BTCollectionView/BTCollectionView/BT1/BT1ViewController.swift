//
//  BT1ViewController.swift
//  BTCollectionView
//
//  Created by Tuan Tran V. VN.Danang on 5/27/22.
//

import UIKit

final class BT1ViewController: UIViewController {
    
    var users: [User] = User.getDummyDatas()
    //MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let nib = UINib(nibName: "UserCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }

}

extension BT1ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCell
        let item = users[indexPath.row]
        cell.nameLabel.text = item.name
        cell.avatarImageView.image = UIImage(named: "user")
        return cell
    }
}

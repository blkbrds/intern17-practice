//
//  Bai1ViewController.swift
//  CollectionView
//
//  Created by luong.tran on 20/09/2022.
//

import UIKit

final class Bai1ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let collName = String(describing: Bai1CollectionViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }

    private func configCollectionView() {
        let cellNib = UINib(nibName: collName, bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: collName)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension Bai1ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collName, for: indexPath) as! Bai1CollectionViewCell
        cell.updateCell(number: "\(indexPath.row + 1)")
        return cell
    }
}

extension Bai1ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}

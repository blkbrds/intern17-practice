//
//  Bai1ViewController.swift
//  CollectionView
//
//  Created by luong.tran on 20/09/2022.
//

import UIKit

final class Bai1ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: Bai1ViewModel?
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Define.numbersItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Define.identifier, for: indexPath) as? Bai1CollectionViewCell,
              let viewModel = viewModel else {
            return UICollectionViewCell()
        }
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
}

extension Bai1ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Define.sizeItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Define.insetItem
    }
}

extension Bai1ViewController {
    private struct Define {
        static var identifier = "Bai1CollectionViewCell"
        static var numbersItems: Int = 100
        static var sizeItem: CGSize = CGSize(width: 60, height: 60)
        static var insetItem: UIEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}

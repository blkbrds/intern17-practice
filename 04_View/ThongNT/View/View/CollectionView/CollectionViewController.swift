//
//  CollectionViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

enum CellType: String {
    case custom = "CustomCollectionViewCell"
    case base = "UICollectionViewCell"
}

final class CollectionViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        configNaviBar()
    }
    
    //MARK: - Private functions
    private func configCollectionView() {
        title = "Collection View"
        if let layout = collectionView?.collectionViewLayout as? CustomLayout {
            layout.delegate = self
        }
        let customNib = UINib(nibName: CellType.custom.rawValue, bundle: .main)
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: CellType.base.rawValue)
        collectionView.register(customNib,
                                forCellWithReuseIdentifier: CellType.custom.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configNaviBar() {
        let basicCollectionViewButton = UIBarButtonItem(title: "Basic", style: .plain, target: self, action: #selector(goToBasicCollectionVC))
        navigationItem.rightBarButtonItem = basicCollectionViewButton
    }
    
    @objc private func goToBasicCollectionVC() {
        navigationController?.pushViewController(BasicCollectionViewController(), animated: true)
    }
}

//MARK: - Extension Datasource and Delegate of CollectionView
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.custom.rawValue,
                                                            for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        item.backgroundColor = .systemBlue
        return item
    }
}

extension CollectionViewController: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return CGFloat.random(in: 50...300)
    }
}

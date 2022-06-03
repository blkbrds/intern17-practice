//
//  Bai2ViewController.swift
//  collectionView
//
//  Created by Tinh Bui T. VN.Danang on 5/26/22.
//

import UIKit

final class Bai2ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    // MARK: - Private functions
    private func configCollectionView() {
        let nib = UINib(nibName: "Bai2CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "Bai2CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegateFlowLayout & UICollectionViewDataSource
extension Bai2ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Bai2CollectionViewCell", for: indexPath) as! Bai2CollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width - (20 * 4))/3, height: CGFloat.random(in: 50...200))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }
}


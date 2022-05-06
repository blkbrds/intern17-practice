//
//  Ex4ViewController.swift
//  CollectionView
//
//  Created by tri.nguyen on 02/05/2022.
//

import UIKit

final class Ex4ViewController: UIViewController {
    
    // MARK: - Enum
    enum IdentifierEx4: String {
        case cell = "Ex4CollectionCell"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Collection4"
        
        // register
        let nib = UINib(nibName: IdentifierEx4.cell.rawValue, bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: IdentifierEx4.cell.rawValue)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - Extention
extension Ex4ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdentifierEx4.cell.rawValue, for: indexPath) as! Ex4CollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Config.screenWidth, height: Config.screenHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 10)
    }
}

// MARK: - Config
extension Ex4ViewController {
    struct Config {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width - 10
        static let screenHeight: CGFloat = 85
    }
}


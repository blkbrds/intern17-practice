//
//  Ex2ViewController.swift
//  CollectionView
//
//  Created by tri.nguyen on 06/05/2022.
//

import UIKit

// MARK: - Model
final class Item {
    
    // MARK: - Properties
    var number: String
    
    // init
    init(number: String) {
        self.number = number
    }
}

// MARK: - Dummy Data
extension Item {
    static func getDummyData() -> [Item] {
        var items: [Item] = []
        for i in 0...10 {
            let item = Item(number: "\(i)")
            items.append(item)
        }
        return items
    }
}

final class Ex2ViewController: UIViewController {

    // MARK: - Life cycle
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var items: [Item] = Item.getDummyData()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        // title
        title = "Collection2"
        // register
        let nib = UINib(nibName: "Ex2Cell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        // delegate && datsource
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - Extention UICollectionViewDataSource && UICollectionViewDelegateFlowLayout
extension Ex2ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Ex2Cell
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Config.itemWidth, height: Config.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}

// MARK: - Config
extension Ex2ViewController {
    struct Config {
        static let itemWidth: CGFloat = (UIScreen.main.bounds.width - 85) / 3
        static let itemHeight: CGFloat = .random(in: 100..<299)
    }
}

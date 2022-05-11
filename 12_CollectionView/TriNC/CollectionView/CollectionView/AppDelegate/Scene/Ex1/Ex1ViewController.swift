//
//  Ex1ViewController.swift
//  CollectionView
//
//  Created by tri.nguyen on 02/05/2022.
//

import UIKit

// MARK: - Model
final class User {
    
    // MARK: - Properties
    var number: String
    
    // init
    init(number: String) {
        self.number = number
    }
}

// MARK: - Dummy Data
extension User {
    static func getDummyData() -> [User] {
        var users: [User] = []
        for i in 0...49 {
            let user = User(number: "\(i)")
            users.append(user)
        }
        return users
    }
}

final class Ex1ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var users: [User] = User.getDummyData()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        title = "Collection 1"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register
        let nib = UINib(nibName: "Ex1Cell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
}

// MARK: - Extention
extension Ex1ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Ex1Cell
        let items = users[indexPath.row]
        cell.numberLabel.text = items.number
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Config.screenWidth, height: Config.screenHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
    }
}

// MARK: - Config
extension Ex1ViewController {
    struct Config {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width / 6.0
        static let screenHeight: CGFloat = 70
    }
}

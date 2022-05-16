//
//  Ex3ViewController.swift
//  CollectionView
//
//  Created by tri.nguyen on 02/05/2022.
//

import UIKit

final class Ex3ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Enum
    enum Identifier: String {
        case cell = "HeroCell"
        case header = "TeamHeaderReusableView"
        case footer = "TeamFooterReusableView"
    }
    
    // MARK: - Properties
    private var teams: [Team] = [.xmen, .avengers, .guardians]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        title = "Collection 3"
        view.backgroundColor = .cyan
        configCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: Identifier.cell.rawValue, bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: Identifier.cell.rawValue)
        
        let headerNib = UINib(nibName: Identifier.header.rawValue, bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Identifier.header.rawValue)
        
        let footerNib = UINib(nibName: Identifier.footer.rawValue, bundle: .main)
        collectionView.register(footerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Identifier.footer.rawValue)
    }
}

// MARK: - Extention UICollectionViewDataSource
extension Ex3ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let teams = Team(rawValue: section) else { fatalError("Team value is nil")}
        return teams.members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let teams = Team(rawValue: indexPath.section) else { fatalError("Team value is nil")}
        guard indexPath.item < teams.members.count else { fatalError("Member index is out of bounds")}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.cell.rawValue, for: indexPath) as! HeroCell
        cell.updateCell(avatar: teams.members[indexPath.item].avatar, name: teams.members[indexPath.item].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let teams = Team(rawValue: indexPath.section) else { fatalError("Team value is nil")}
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Identifier.header.rawValue, for: indexPath) as? TeamHeaderReusableView {
                header.updateHeaderView(avatar: teams.teamAvatar, name: teams.teamName)
                return header
            }
            
        case UICollectionView.elementKindSectionFooter:
            if let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Identifier.footer.rawValue, for: indexPath) as? TeamFooterReusableView {
                return footer
            }
        default: return UICollectionReusableView()
        }
        
        return UICollectionReusableView()
    }
}

// MARK: - Extention UICollectionViewDelegateFlowLayout
extension Ex3ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Config.itemWidth , height: Config.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 250, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 250, height: 40)
    }
}

// MARK: - Config
extension Ex3ViewController {
    
    // Define
    struct Config {
        static let itemWidth: CGFloat = (UIScreen.main.bounds.width / 5)
        static let itemHeight: CGFloat = 110.0
    }
}



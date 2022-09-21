//
//  LyThuyetViewController.swift
//  CollectionView
//
//  Created by luong.tran on 19/09/2022.
//

import UIKit

final class LyThuyetViewController: UIViewController {

    var status = Status.standard
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let collNameNib = String(describing: HeroCollectionViewCell.self)
    private let collHeaderReusa = String(describing: TeamHeaderCollectionReusableView.self)
    private let collFooterReusa = String(describing: TeamFooterCollectionReusableView.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MARVEL"
        configCollectionView()
        turnOnStandardMode()
    }

    private func configCollectionView() {
        let cellNib = UINib(nibName: collNameNib, bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: collNameNib)
        
        let headerNib = UINib(nibName: collHeaderReusa, bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collHeaderReusa)
        
        let cellFooter = UINib(nibName: collFooterReusa, bundle: Bundle.main)
        collectionView.register(cellFooter, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: collFooterReusa)
        
        collectionView.dataSource = self
//        collectionView.delegate = self
    }
    
    @objc private func turnOnStandardMode() {
        changeFlowLayout(status: .standard)
        let smallButton = UIBarButtonItem(title: "Small", style: .plain, target: self, action: #selector(turnOnSmallMode))
        navigationItem.rightBarButtonItem = smallButton
    }
    
    @objc private func turnOnSmallMode() {
        changeFlowLayout(status: .small)
        let standardButton = UIBarButtonItem(title: "Standard", style: .plain, target: self, action: #selector(turnOnStandardMode))
        navigationItem.rightBarButtonItem = standardButton
    }
    
    private func changeFlowLayout(status: Status) {
        self.status = status
        if let headerViews = self.collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader) as? [TeamHeaderCollectionReusableView] {
            for headerView in headerViews {
                headerView.updateHeaderView(status: status)
            }
        }
        if let cells = self.collectionView.visibleCells as? [HeroCollectionViewCell] {
            for cell in cells {
                cell.updateCell(status: status)
            }
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = status.itemSize
        flowLayout.sectionInset = status.sectionInset
        flowLayout.headerReferenceSize = status.headerReferenceSize
        flowLayout.footerReferenceSize = status.footerReferenceSize
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
    
}

extension LyThuyetViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Team.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let team = Team(rawValue: section)
        else { fatalError("Team value is nil") }
        return team.members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let team = Team(rawValue: indexPath.section)
        else { fatalError("Team value is nil") }
        
        guard indexPath.item < team.members.count
        else { fatalError("Member index is out of bounds") }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collNameNib, for: indexPath) as! HeroCollectionViewCell
        cell.updateCell(avatar: team.members[indexPath.item].avatar, name: team.members[indexPath.item].name, status: status)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let team = Team(rawValue: indexPath.section)
            else { fatalError("Team value is nil") }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collHeaderReusa, for: indexPath) as! TeamHeaderCollectionReusableView
            header.updateHeaderView(avatar: team.teamAvatar, name: team.teamName, status: status)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: collFooterReusa, for: indexPath) as! TeamFooterCollectionReusableView
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension LyThuyetViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: 400, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        CGSize(width: 400, height: 40)
    }
}

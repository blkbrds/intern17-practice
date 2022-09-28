//
//  LyThuyetViewModel.swift
//  CollectionView
//
//  Created by luong.tran on 27/09/2022.
//

import Foundation
import UIKit

final class LyThuyetViewModel {
    
    var status = Status.standard
    
    func numberOfSections() -> Int {
        return Team.count
    }
    
    func numberOfItemsInSection(in section: Int) -> Int {
        guard let team = Team(rawValue: section) else { return 0 }
        return team.members.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> HeroCellViewModel {
        guard let team = Team(rawValue: indexPath.section) else { return HeroCellViewModel(avatar: UIImage(systemName: "person.fill")!, name: "", status: status)}
        guard indexPath.item < team.members.count
        else { fatalError("Member index is out of bounds") }
        let cellViewModel = HeroCellViewModel(avatar: team.members[indexPath.item].avatar, name: team.members[indexPath.item].name, status: status)
        return cellViewModel
    }
    
    func viewModelHeader(at indexPath: IndexPath) -> TeamHeaderCellViewModel {
        guard let team = Team(rawValue: indexPath.section) else { return TeamHeaderCellViewModel(avatar: UIImage(systemName: "person.fill")!, name: "", status: status)}
        let cellViewModel = TeamHeaderCellViewModel(avatar: team.teamAvatar, name: team.teamName, status: status)
        return cellViewModel
    }
    
}

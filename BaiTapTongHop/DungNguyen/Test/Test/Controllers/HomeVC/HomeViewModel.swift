//
//  HomeViewModel.swift
//  Test
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/20/22.
//

import Foundation

final class HomeViewModel {
    
    // MARK: - Propertie
    var users: [User] = []
    var indexPathSelected: IndexPath = IndexPath(row: 0, section: 0)
    
    // MARK: - Function
    func loadCell() {
        guard let user = getUserFromPlist(withName: "User") else { return }
        for item in user {
            let tempUser: User = User()
            tempUser.name = item["name"] as? String
            tempUser.avatar = item["avatar"] as? String
            tempUser.birthday = item["birthday"] as? String
            users.append(tempUser)
        }
    }
    
    private func getUserFromPlist(withName name: String) -> [[String: Any]]? {
        var config: [[String: Any]]?
        if let infoPlistPath = Bundle.main.url(forResource: name, withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [[String: Any]] {
                    config = dict
                }
            } catch {
                print(error)
            }
        }
        return config
    }
    
    func updateUser(user: User) {
        users[indexPathSelected.row] = user
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberRowOfSection(in section: Int) -> Int {
        return users.count
    }
    
    func cellViewModelForRow(at indexPath: IndexPath) -> HomeCellViewModel {
        let item = users[indexPath.row]
        let cellViewModel = HomeCellViewModel(user: item)
        return cellViewModel
    }
    
    func viewModelForDetail(at indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(user: users[indexPath.row])
    }
}

//
//  HomeViewModel.swift
//  Test
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/20/22.
//

import Foundation
final class HomeViewModel {
    
    var users: [User] = []
    var indexPathSelected: IndexPath = IndexPath(row: 0, section: 0)
    
    func getDataFromPlist() {
        var datas: [[String: Any]] = []
        if let infoPlistPath = Bundle.main.url(forResource: "User", withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [[String: Any]] {
                    datas = dict
                }
            } catch {
                print(error)
            }
        }
        for user in datas {
            let tempUser: User = User(name: "", birthday: "", avatarImage: "")
            tempUser.name = user["name"] as? String ?? ""
            tempUser.birthday = user["birthday"] as? String ?? ""
            tempUser.avatarImage = user["avatar"] as? String ?? ""
            users.append(tempUser)
        }
    }
    
    func numberOfRowInSection(in section: Int) -> Int {
        users.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> HomeCellViewModel {
        let item = users[indexPath.row]
        let cellViewModel = HomeCellViewModel(user: item)
        return cellViewModel
    }
    
    func viewModelForDetail(at indexPath: IndexPath) -> DetailViewModel {
        let user = users[indexPath.row]
        return DetailViewModel(user: user)
    }
    
    func updateUser(user: User) {
        users[indexPathSelected.row] = user
    }
}


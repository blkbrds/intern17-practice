//
//  HomeViewModel.swift
//  ThucHanh
//
//  Created by tu.le2 on 20/07/2022.
//

import Foundation

final class HomeViewModel {
    enum GetDataResult {
        case success
        case failure(String)
    }
    
    var user: [UserModel] = []
    typealias Completion = (GetDataResult) -> Void
    
    private func getDataPlist(withName name: String) -> [String: Any]?
    {
        var config: [String: Any]?
        if let infoPlistPath = Bundle.main.url(forResource: name, withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    config = dict
                }
            } catch {
                print(error)
            }
        }
        
        return config
    }
    
    func loadData(completion: Completion) {
        guard let listUser = getDataPlist(withName: "userList") else {
            completion(.failure("Không tồn tại file"))
            return
        }
        
        for (_, value) in listUser {
            guard let value = value as? NSDictionary else{
                return
            }
            
            user.append(UserModel(name: value["name"] as? String ?? "", birthday: value["birthday"] as? String ?? ""))
            completion(.success)
        }
    }
    
    func numberOfRowInSection(in section: Int) -> Int {
        guard let listUser = getDataPlist(withName: "userList") else {
            return 0
        }
        
        return listUser.count
    }
    
    func viewModelForItem (at indexPath: IndexPath) -> HomeTableCellViewModel {
        let item = user[indexPath.row]
        
        let cell = HomeTableCellViewModel(user: item)
        
        return cell
    }

    func viewModelForDetail(at indexPath: IndexPath) -> DetailViewModel {
        let user = user[indexPath.row]
        return DetailViewModel(user: user)
    }
}

//
//  File.swift
//  BTTableView
//
//  Created by Tuan Tran V. VN.Danang on 5/26/22.
//

import Foundation

final class DataManager {
    
    //MARK: -Singleton
    private static var sharedDataManager: DataManager {
        let dataManager = DataManager()
        return dataManager
    }
    
    class func shared() -> DataManager {
        return sharedDataManager
    }
    
    private init() {}
    
    func read() throws -> [String: [String]] {
        guard let plistURL = Bundle.main.url(forResource: "users", withExtension: "plist") else { return ["": ["",""]] }
        let data = try Data(contentsOf: plistURL)
        guard let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String:[String]] else {
            return [:]
        }
        return plist
    }
    
    func save(_ plist: Any) {
        guard let plistURL = Bundle.main.url(forResource: "users", withExtension: "plist") else { return }
        do {
            let plistData = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
            try plistData.write(to: plistURL)
        }
        catch {
            print(error)
        }
    }
}


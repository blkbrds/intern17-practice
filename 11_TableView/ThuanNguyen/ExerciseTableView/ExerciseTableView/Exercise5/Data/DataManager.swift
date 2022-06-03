//
//  DataManager.swift
//  ExerciseTableView
//
//  Created by thuan.nguyen on 03/06/2022.
//

import Foundation

final class DataManager {

    //singleton
    static let shared = DataManager()
   
    func configData() -> [String] {
        guard let path = Bundle.main.path(forResource: "ListName", ofType: "plist"),
              let contactData = NSArray(contentsOfFile: path) as? [String] else { return [] }
        return contactData
    }
    
}

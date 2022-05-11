//
//  HomeViewModel.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import Foundation

final class HomeViewModel {
    
    typealias Completion = (Bool, String) -> Void
    
    // MARK: - Properties
    var email: String = ""
    var password: String = ""
    var musics: [Music] = []
    
    // MARK: - Load API
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/25/albums.json"
        API.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]
                    
                    for item in results {
                        let music = Music(json: item)
                        self.musics.append(music)
                        
                        completion(true, "")
                    }
                } else {
                    completion(false, "Data format is error.")
                }
            }
        }
    }
    
    // MARK: - Fetch Data
    func fetchData(completion: (Bool, String, String) -> ()) {
        let data = DataManager.shared().read()
        let email = data.0
        let password = data.1
        
        if email != "" || password != "" {
            // save Data
            self.email = email
            self.password = password
            
            // callback
            completion(true, email, password)
        } else {
            // callback
            completion(false, "", "")
        }
    }
}

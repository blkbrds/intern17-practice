//
//  HomeViewModel.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import Foundation

final class HomeViewModel {
    
    typealias Completion = (Bool, APIError?) -> Void
    
    // MARK: - Properties
    private(set) var email: String = ""
    private(set) var password: String = ""
    private(set) var musics: [Music] = []
    
    // MARK: - Load API
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        HomeService.getMusicDetail(urlString: urlString) { [weak self] datas in
            if let music = datas {
                guard let this = self else { return }
                this.musics = music
                completion(true, nil)
            } else {
                completion(false, .error("Data is nil"))
            }
        }
    }

    func viewModelForCell(at indexPath: IndexPath) -> HomeCellViewModel {
        return HomeCellViewModel(music: musics[indexPath.row])
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

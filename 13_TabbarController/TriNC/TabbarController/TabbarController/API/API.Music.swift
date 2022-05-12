//
//  API.Music.swift
//  TabbarController
//
//  Created by tri.nguyen on 12/05/2022.
//

import Foundation

extension APIManager.Music {
    
    struct QueryString {
        func hotMusic(limit: Int) -> String {
            return APIManager.Path.base_domain +
            APIManager.Path.base_path +
            APIManager.Path.music_path +
            APIManager.Path.music_hot +
            "/all/\(limit)/explicit.json"
        }
    }
    
    struct MusicResult {
        var musics: [Music]
    }
}

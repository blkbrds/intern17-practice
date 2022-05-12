//
//  API.Manager.swift
//  TabbarController
//
//  Created by tri.nguyen on 12/05/2022.
//

import Foundation

//https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/10/explicit.json
//https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json

//https://rss.itunes.apple.com -> Domain
//api/v1/us - > path
//itunes-music -> path
//hot-tracks -> business

struct APIManager {
    
    // MARK: - Config
    struct Path {
        static let base_domain = "https://rss.itunes.apple.com"
        static let base_path = "/api/v1/us"
        static let music_path = "/itunes-music"
        static let music_hot = "/hot-tracks"
    }
    
    // MARK: - Domain
    struct Music {}
    
    struct Downloader {}
}

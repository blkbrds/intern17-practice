//
//  Data.swift
//  API
//
//  Created by tri.nguyen on 16/05/2022.
//

import Foundation

struct DataModel: Codable {
    var feed: FeedModel?
}

struct FeedModel: Codable {
    var author: AuthorModel?
}

struct AuthorModel: Codable {
    var name: LabelModel?
    var uri: LabelModel?
}

struct LabelModel: Codable {
    var label: String?
}

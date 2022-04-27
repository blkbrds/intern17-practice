//
//  YouTubeResponse.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/20/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

struct Videos: Mappable {

    var items: [Snippet] = []
    var nextPageToken: String?
    var prevPageToken: String?

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        items <- map["items"]
        nextPageToken <- map["nextPageToken"]
        prevPageToken <- map["prevPageToken"]
    }
}

struct Snippet: Mappable {

    var id: String?
    var title: String?
    var publishedAt: String?
    var channelId: String?
    var channelTitle: String?
    var description: String?
    var imageString: String?

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        id <- map["id"]
        if id == nil {
            id <- map["id.videoId"]
        }
        title <- map["snippet.title"]
        publishedAt <- map["snippet.publishedAt"]
        channelId <- map["snippet.channelId"]
        channelTitle <- map["snippet.channelTitle"]
        description <- map["snippet.localized.description"]
        imageString <- map["snippet.thumbnails.medium.url"]
    }
}

struct Channel: Mappable {

    var items: [ChannelSnippet]?

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        items <- map["items"]
    }
}

struct ChannelSnippet: Mappable {

    var channelTitle: String?
    var channelThumbnail: String?

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        channelTitle <- map["snippet.title"]
        channelThumbnail <- map["snippet.thumbnails.default.url"]
    }
}

struct Comments: Mappable {

    var items: [CommentSnippet]?

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        items <- map["items"]
    }
}

struct CommentSnippet: Mappable {

    var comment: String?
    var authorName: String?
    var authorImgeURL: String?

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        comment <- map["snippet.topLevelComment.snippet.textOriginal"]
        authorName <- map["snippet.topLevelComment.snippet.authorDisplayName"]
        authorImgeURL <- map["snippet.topLevelComment.snippet.authorProfileImageUrl"]
    }
}

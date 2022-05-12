//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import Alamofire

typealias APIPath = Api.Path

final class Api {

    struct Path {
        static let maxResults: Int = 10
        static let apiKey: String = "AIzaSyCkEdbynPk3x78egrkR7B5sBg2AGr9kaEU"
        static let baseURL = "https://youtube.googleapis.com/youtube/v3"
    }
}

extension Api.Path {

    // API to get videos and relation
    struct Videos {

        // Get videos by region and most popular with maximum results
        var videos: String {
            return baseURL / "videos?part=snippet&chart=mostPopular&maxResults=\(maxResults)&regionCode=VN&key=\(apiKey)"
        }

        // Load more video with nextPageToken
        func loadMoreVideos(with nextToken: String) -> String {
            return baseURL / "videos?part=id&part=snippet&chart=mostPopular&maxResults=\(maxResults)&pageToken=\(nextToken)&key=\(apiKey)"
        }

        // Load relate video with video Id
        func loadRelateVideos(with videoId: String) -> String {
            return baseURL / "search?part=snippet&maxResults=\(maxResults)&relatedToVideoId=\(videoId)&type=video&key=\(apiKey)"
        }

        // Load videos with list of id
        func loadVideosbyIds(with ids: [String]) -> String {
            var stringOfIds = ""
            ids.forEach { id in
                stringOfIds.append("id=\(id)&")
            }
            return baseURL / "videos?part=snippet&part=id&\(stringOfIds)key=\(apiKey)"
        }
    }

    // API get info of channel with id channel
    struct Channel {

        let channelId: String

        var channel: String {
            return baseURL / "channels?part=id&part=snippet&id=\(channelId)&key=\(apiKey)"
        }
    }

    // API get comments of video with video id
    struct Comments {

        let videoId: String

        var comments: String {
            return baseURL / "commentThreads?part=snippet&videoId=\(videoId)&key=\(apiKey)"
        }
    }
}

protocol URLStringConvertible {
    var urlString: String { get }
}

protocol ApiPath: URLStringConvertible {
    static var path: String { get }
}

private func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
    return lhs.urlString + "/" + rhs.urlString
}

extension String: URLStringConvertible {
    var urlString: String { return self }
}

private func / (left: String, right: Int) -> String {
    return left.appending(path: "\(right)")
}

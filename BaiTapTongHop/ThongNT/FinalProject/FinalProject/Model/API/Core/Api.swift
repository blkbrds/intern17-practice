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
        static let apiKey: String = "AIzaSyCkEdbynPk3x78egrkR7B5sBg2AGr9kaEU"
        static let baseURL = "https://youtube.googleapis.com/youtube/v3"
    }
}

extension Api.Path {

    // API to get videos most popular
    struct Videos {

//        let videoIds: [String]

        // Get videos by region with maximum results
        var videos: String {
            return baseURL / "videos?part=snippet&chart=mostPopular&maxResults=2&regionCode=VN&key=\(apiKey)"
        }

//        // Get video by list of id
//        var video: String {
//            var stringOfIds: String = ""
//            videoIds.forEach {
//                stringOfIds.append("id=\($0)&")
//            }
//            return baseURL / "videos?part=id&part=snippet&id=\(stringOfIds)key=\(apiKey)"
//        }
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

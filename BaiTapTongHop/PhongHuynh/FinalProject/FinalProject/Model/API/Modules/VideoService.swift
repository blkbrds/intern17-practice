//
//  VideoService.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/27/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

final class VideoService {

    class func loadVideoTrendingAPI(completion: @escaping CompletionAny) {
        var params: [String: Any] = [:]
        params["part"] = "snippet"
        params["chart"] = "mostPopular"
        params["maxResults"] = 30
        params["regionCode"] = "VN"
        params["key"] = Session.shared.apiKey
        let url = "https://youtube.googleapis.com/youtube/v3/videos"
        api.request(method: .get, urlString: url, parameters: params) { (result) in
            Mapper<Video>().mapArray(result) { (items: [Video]?, error: Error?) in
                completion(items, error)
            }
        }
    }

    class func loadVideoNominationAPI(completion: @escaping CompletionAny) {
        var params: [String: Any] = [:]
        params["part"] = "snippet"
        params["maxResults"] = 20
        params["relatedToVideoId"] = "XtHh0uNscnk"
        params["type"] = "video"
        params["key"] = Session.shared.apiKey
        let url = "https://youtube.googleapis.com/youtube/v3/search"
        api.request(method: .get, urlString: url, parameters: params) { (result) in
            Mapper<Video>().mapArray(result) { (items: [Video]?, error: Error?) in
                completion(items, error)
            }
        }
    }

    class func loadVideoNewAPI(completion: @escaping CompletionAny) {
        var params: [String: Any] = [:]
        params["part"] = "snippet"
        params["maxResults"] = 20
        params["relatedToVideoId"] = "jXKR9kl5tR8"
        params["type"] = "video"
        params["key"] = Session.shared.apiKey
        let url = "https://youtube.googleapis.com/youtube/v3/search"
        api.request(method: .get, urlString: url, parameters: params) { (result) in
            Mapper<Video>().mapArray(result) { (items: [Video]?, error: Error?) in
                completion(items, error)
            }
        }
    }

    class func loadDetailAPI(id: String, completion: @escaping CompletionAny) {
        var params: [String: Any] = [:]
        params["part"] = "snippet"
        params["maxResults"] = 20
        params["relatedToVideoId"] = id
        params["type"] = "video"
        params["key"] = Session.shared.apiKey
        let url = "https://youtube.googleapis.com/youtube/v3/search"
        api.request(method: .get, urlString: url, parameters: params) { (result) in
            Mapper<Video>().mapArray(result) { (items: [Video]?, error: Error?) in
                completion(items, error)
            }
        }
    }

    class func loadSearchVideoAPI(keyword: String, completion: @escaping CompletionAny) {
        var params: [String: Any] = [:]
        params["part"] = "snippet"
        params["maxResults"] = 20
        params["q"] = keyword
        params["type"] = "video"
        params["key"] = Session.shared.apiKey
        let url = "https://youtube.googleapis.com/youtube/v3/search"
        api.request(method: .get, urlString: url, parameters: params) { (result) in
            Mapper<Video>().mapArray(result) { (items: [Video]?, error: Error?) in
                completion(items, error)
            }
        }
    }
}

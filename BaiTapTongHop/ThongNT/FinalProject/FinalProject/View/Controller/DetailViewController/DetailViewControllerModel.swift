//
//  DetailViewControllerModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/22/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class DetailViewControllerModel {

    private var snippet: Snippet?
    private var channel: Channel?
    private var comments: [CommentSnippet]?
    private var videos: Videos?

    init(snippet: Snippet?) {
        self.snippet = snippet
    }

    func getVideoId() -> String {
        guard let videoId: String = snippet?.id else { return "" }
        return videoId
    }

    func getTitle() -> String {
        guard let videoTitle = snippet?.title else { return "" }
        return videoTitle
    }

    func getDescription() -> String {
        guard let videoDescription = snippet?.description else { return "" }
        return videoDescription
    }

    func getChannelTitle() -> String {
        guard let channelTitle = snippet?.channelId else { return "Official" }
        return channelTitle
    }

    func getChannelId() -> String {
        guard let channelId = snippet?.channelId else { return "" }
        return channelId
    }

    func getChannelSnippet() -> ChannelSnippet? {
        guard let channel = channel, let snippet = channel.items?.first else { return nil }
        return snippet
    }

    func getComments() -> [CommentSnippet] {
        guard let comments = comments else { return [] }
        return comments
    }

    func loadChannelApi(completion: @escaping (Error?) -> Void) {
        let channelId = getChannelId()
        Youtube.loadAPI(withChannel: channelId) { [weak self] result in
            switch result {
            case .success(let channelInfo):
                self?.channel = channelInfo
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }

    func loadCommentsApi(completion: @escaping (Error?) -> Void) {
        guard let id = snippet?.id else { return }
        Youtube.loadAPI(withVideo: id) { [weak self] result in
            switch result {
            case .success(let comment):
                self?.comments = comment?.items
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }

    func api(completion: @escaping (Error?) -> Void) {
        print("videoID: ", getVideoId())
        Youtube.loadRelateAPI(with: getVideoId()) { result in
            switch result {
            case .success(let data):
                self.videos = data
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }

    func getVideosCount() -> Int {
        guard let videos = videos else { return 0 }
        return videos.items.count
    }

    func getSnippet(with index: Int) -> Snippet? {
        guard let videos = videos else { return nil }
        guard index >= 0, index < videos.items.count else { return nil }
        return videos.items[index]
    }

    func loadMore(completion: @escaping (Error?) -> Void) {
        guard let nextToken = videos?.nextPageToken else { return }
        Youtube.loadMore(with: nextToken) { [weak self] result in
            switch result {
            case .success(let newVideos):
                guard let newVideos = newVideos else { return }
                self?.videos?.items.append(contentsOf: newVideos.items)
                self?.videos?.nextPageToken = newVideos.nextPageToken
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}

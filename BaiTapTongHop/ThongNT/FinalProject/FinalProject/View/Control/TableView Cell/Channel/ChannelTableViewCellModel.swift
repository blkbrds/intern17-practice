//
//  ChannelTableViewCellModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/25/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class ChannelTableViewCellModel {

    private var channelSnippet: ChannelSnippet?

    init(channelSnippet: ChannelSnippet?) {
        self.channelSnippet = channelSnippet
    }

    func getChannelId() -> String? {
        return channelSnippet?.channelThumbnail
    }

    func getChannelTitle() -> String? {
        return channelSnippet?.channelTitle
    }
}

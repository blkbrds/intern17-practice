//
//  ThumbnailTableViewCellModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/21/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class ThumbnailTableViewCellModel {

    var snippet: Snippet?

    init(snippet: Snippet?) {
        self.snippet = snippet
    }

    // MARK: - Private functions
    private func formatDate(from date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let dateFormated = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: dateFormated)
        } else {
            return "3 hours ago"
        }
    }

    func getPublishDate() -> String {
        guard let snippet = snippet, let date = snippet.publishedAt else { return "" }
        return formatDate(from: date)
    }

    func getTitle() -> String {
        guard let snippet = snippet, let title = snippet.title else { return "" }
        return title
    }
}

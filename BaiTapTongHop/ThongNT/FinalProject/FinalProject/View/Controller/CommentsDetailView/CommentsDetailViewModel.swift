//
//  CommentsDetailViewModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/29/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class CommentsDetailViewModel {

    private var comments: [CommentSnippet]?

    init(comments: [CommentSnippet]) {
        self.comments = comments
    }

    func getComment(with index: Int) -> CommentSnippet? {
        guard let comments = comments else { return nil }
        guard 0..<comments.count ~= index else { return nil }
        return comments[index]
    }

    func getCommentsCount() -> Int {
        guard let comments = comments else { return 0 }
        return comments.count
    }
}

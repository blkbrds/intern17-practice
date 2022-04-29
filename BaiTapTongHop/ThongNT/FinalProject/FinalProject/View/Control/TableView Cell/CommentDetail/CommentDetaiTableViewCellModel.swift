//
//  CommentDetaiTableViewCellModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/29/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class CommentDetaiTableViewCellModel {

    private var comment: CommentSnippet

    init(with comment: CommentSnippet) {
        self.comment = comment
    }

    func getAuthorName() -> String? {
        return comment.authorName
    }

    func getAuthorImageUrl() -> URL? {
        guard let imageString = comment.authorImgeURL else { return nil }
        return URL(string: imageString)
    }

    func getAuthorComment() -> String? {
        return comment.comment
    }
}

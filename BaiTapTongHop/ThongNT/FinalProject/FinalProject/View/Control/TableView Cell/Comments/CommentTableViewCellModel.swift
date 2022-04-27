//
//  CommentTableViewCellModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/25/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class CommentTableViewCellModel {

    private var comments: [CommentSnippet] = []

    init(commments: [CommentSnippet]) {
        self.comments = commments
    }

    func getComments(with index: Int) -> String {
        guard index >= 0, index < comments.count else { return "" }
        guard let comment = comments[index].comment else { return "" }
        return comment
    }

    func getAuthorImageURL(with index: Int) -> String {
        guard index >= 0, index < comments.count else { return "" }
        guard let imageURL = comments[index].authorImgeURL else { return "" }
        return imageURL
    }
}

//
//  CommentsView.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/29/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class CommentsDetailView: UIView {

    @IBOutlet private weak var tableView: UITableView!

    var viewModel: CommentsDetailViewModel? {
        didSet {
            tableView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        configTableView()
    }

    // MARK: Private functions
    private func setupUI() {

    }

    private func configTableView() {
        let commentDetailNib = UINib(nibName: "CommentDetailTableViewCell", bundle: .main)
        tableView.register(commentDetailNib, forCellReuseIdentifier: "CommentDetailTableViewCell")
        let customHeaderNib = UINib(nibName: "CustomHeaderView", bundle: .main)
        tableView.register(customHeaderNib, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: Extension delegate of tableView
extension CommentsDetailView: UITableViewDelegate {

}

// MARK: Extension datasource of tableView
extension CommentsDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.getCommentsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentDetailTableViewCell",
                                                       for: indexPath) as? CommentDetailTableViewCell else { return UITableViewCell() }
        if let comment = viewModel?.getComment(with: indexPath.row) {
            cell.viewModel = CommentDetaiTableViewCellModel(with: comment)
            print("comment \(indexPath.row):", comment)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let customHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as? CustomHeaderView else { return UIView() }
        let headerView = UIView()
        headerView.backgroundColor = .white
        customHeader.frame = headerView.frame
        headerView.addSubview(customHeader)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

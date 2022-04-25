//
//  DetailViewController.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/21/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

final class DetailViewController: UIViewController {

    // MARK: - IBOutlets private variables
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var videoView: YTPlayerView!

    var viewModel: DetailViewControllerModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadApi()
        loadCommentApi()
        loadVideoApi()
        setupUI()
    }

    // MARK: - Private functions
    private func setupUI() {
        title = "Details"
        getVideo()
        videoView.clipsToBounds = true
        videoView.layer.cornerRadius = 5
    }

    private func configTableView() {
        tableView.register(TitleTableViewCell.self)
        tableView.register(ChannelTableViewCell.self)
        tableView.register(CommentsTableViewCell.self)
        tableView.register(ThumbnailTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func loadApi() {
        viewModel?.loadChannelApi(completion: { error in
            if error != nil {
                // Show elert
            } else {
                self.tableView.reloadData()
            }
        })
    }

    private func loadCommentApi() {
        viewModel?.loadCommentsApi(completion: { error in
            if error != nil {
                // Show Alert
            } else {
                self.tableView.reloadData()
            }
        })
    }

    private func loadVideoApi() {
        viewModel?.api(completion: { error in
            if error != nil {
                // show alert
            } else {
                self.tableView.reloadData()
            }
        })
    }

    private func getVideo() {
        guard let videoId = viewModel?.getVideoId() else { return }
        videoView.load(withVideoId: videoId)
    }
}

// MARK: - Extension delegate and dataSource of tableview
extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            guard let count = viewModel?.getVideosCount() else { return 0 }
            return count
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        // Define cells for section 0
        case 0:
            switch indexPath.row {
            case 0:
                // Title cell with row 0, section 0
                guard let titleCell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell")
                        as? TitleTableViewCell else { return UITableViewCell() }
                titleCell.title = viewModel?.getTitle()
                titleCell.selectionStyle = .none
                return titleCell
            case 1:
                // Channel table cell with row 1, section 0
                guard let chanelCell = tableView.dequeueReusableCell(withIdentifier: "ChannelTableViewCell")
                        as? ChannelTableViewCell else { return UITableViewCell() }
                let channelSippet = viewModel?.getChannelSnippet()
                chanelCell.viewModel = ChannelTableViewCellModel(channelSnippet: channelSippet)
                chanelCell.selectionStyle = .none
                return chanelCell
            case 2:
                // Comment table cell with row 2, section 0
                guard let commentsCell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell")
                        as? CommentsTableViewCell else { return UITableViewCell() }
                guard let comments = viewModel?.getComments() else { return UITableViewCell() }
                commentsCell.viewModel = CommentTableViewCellModel(commments: comments)
                commentsCell.selectionStyle = .none
                return commentsCell
            default: break
            }
        case 1:
            guard let videoCell = tableView.dequeueReusableCell(withIdentifier: "ThumbnailTableViewCell", for: indexPath) as? ThumbnailTableViewCell else { return UITableViewCell() }
            videoCell.selectionStyle = .none
            let snippet = viewModel?.getSnippet(with: indexPath.row)
            videoCell.viewModel = ThumbnailTableViewCellModel(snippet: snippet)
            return videoCell
        default: break
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension DetailViewController: UITableViewDelegate {

}

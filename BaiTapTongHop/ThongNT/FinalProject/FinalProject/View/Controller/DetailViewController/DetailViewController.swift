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
        loadData()
        configTableView()
        configGesture()
        setupUI()
    }

    // MARK: - Private functions
    private func setupUI() {
        title = "Details"
    }

    private func configGesture() {
        let downGesture = UISwipeGestureRecognizer(target: self, action: #selector(downSwipe))
        downGesture.direction = .down
        downGesture.delegate = self
        view.addGestureRecognizer(downGesture)
    }

    private func configTableView() {
        tableView.register(TitleTableViewCell.self)
        tableView.register(ChannelTableViewCell.self)
        tableView.register(CommentsTableViewCell.self)
        tableView.register(ThumbnailTableViewCell.self)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func animate() {
        tableView.transform = CGAffineTransform(scaleX: 0.3, y: 2)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.tableView.transform = .identity
        })
        tableView.alpha = 1
    }

    // Prepare data for view
    private func loadData() {
        getVideo()
        loadApi()
        loadCommentApi()
        loadVideoApi()
    }

    private func loadApi() {
        viewModel?.loadChannelApi(completion: { error in
            if let error = error?.localizedDescription {
                self.showAlert(title: "Channel Warning", message: error)
            } else {
                self.tableView.reloadData()
            }
        })
    }

    private func loadCommentApi() {
        viewModel?.loadCommentsApi(completion: { error in
            if let error = error?.localizedDescription {
                self.showAlert(title: "Comments Warning", message: error)
            } else {
                self.tableView.reloadData()
            }
        })
    }

    private func loadVideoApi() {
        viewModel?.api(completion: { error in
            if let error = error?.localizedDescription {
                self.showAlert(title: "Video Warning", message: error)
            } else {
                self.tableView.reloadData()
            }
        })
    }

    private func loadMore() {
        viewModel?.loadMore { error in
            if let error = error?.localizedDescription {
                self.showAlert(title: "Load More Warning", message: error)
            } else {
                self.tableView.reloadData()
            }
        }
    }

    private func getVideo() {
        guard let videoId = viewModel?.getVideoId() else { return }
        videoView.load(withVideoId: videoId)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Extension dataSource of tableview
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
                titleCell.isLiked = {
                    self.viewModel?.addVideo(completion: { done in
                        if done {
                            // layousubview
                        } else {
                            self.showAlert(title: "Warning", message: "Cannot add this video to your Favorite")
                        }
                    })
                }
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
            // List of videos
            guard let videoCell = tableView.dequeueReusableCell(withIdentifier: "ThumbnailTableViewCell", for: indexPath) as? ThumbnailTableViewCell else { return UITableViewCell() }
            videoCell.selectionStyle = .none
            let snippet = viewModel?.getSnippet(with: indexPath.row)
            videoCell.viewModel = ThumbnailTableViewCellModel(snippet: snippet)
            return videoCell
        default: break
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}

// MARK:  - Extension delegate of Tableview
extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        if indexPath.row == (viewModel.getVideosCount() - 1) {
            loadMore()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if indexPath.row == 2 {
                guard let commentDetailView = Bundle.main.loadNibNamed("CommentsDetailView", owner: self, options: nil)?.first as? CommentsDetailView else { return }
                let origin = CGPoint(x: 0, y: 0)
                let frame = tableView.contentSize
                commentDetailView.frame = CGRect(origin: origin, size: frame)
                if let comments = viewModel?.getComments() {
                    commentDetailView.viewModel = CommentsDetailViewModel(comments: comments)
                }
                animate()
                tableView.addSubview(commentDetailView)
            }
        case 1:
            let snippet = viewModel?.getSnippet(with: indexPath.row)
            viewModel = DetailViewControllerModel(snippet: snippet)
            loadData()
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: UIGestureRecognizer Delegate
extension DetailViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }

    @objc private func downSwipe() {
        self.dismiss(animated: true, completion: nil)
    }
}

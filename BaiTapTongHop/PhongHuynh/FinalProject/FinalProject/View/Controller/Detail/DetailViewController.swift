//
//  DetailViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/12/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView
import RealmSwift

final class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var player: WKYTPlayerView!
    @IBOutlet private weak var titleYoutubeLabel: UILabel!

    // MARK: - Properties
    var viewModel: DetailViewModel? {
        didSet {
        }
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
        updateView()
    }

    // MARK: - Private functions
    private func configTableView() {
        tableView.register(DetailCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func updateView() {
        switch viewModel?.type {
        case .featured:
            player.load(withVideoId: viewModel?.featuredVideo?.id ?? "")
            titleYoutubeLabel.text = viewModel?.featuredVideo?.title
        case .nomination:
            player.load(withVideoId: viewModel?.nominationVideo?.videoId ?? "")
            titleYoutubeLabel.text = viewModel?.nominationVideo?.title
        case .new:
            player.load(withVideoId: viewModel?.newVideo?.videoId ?? "")
            titleYoutubeLabel.text = viewModel?.newVideo?.title
        case .none:
            break
        }
    }

    private func loadVideoData(completion: @escaping () -> Void ) {
        viewModel?.loadAPIDetail { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    completion()
                case .failure(let error):
                    print("error\(error)")
                }
            }
        }
    }

    private func loadData() {
        HUD.show()
        let group = DispatchGroup()
        group.enter()
        loadVideoData {
            group.leave()
        }
        group.notify(queue: .main) {
            HUD.dismiss()
            self.tableView.reloadData()
        }
    }

    // MARK: - IBActions
    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
        do {
            let realm = try Realm()
            let data = RealmVideo()
            data.title = viewModel?.featuredVideo?.title ?? ""
            data.id = viewModel?.featuredVideo?.imageURL ?? ""
            try realm.write {
                realm.add(data)
            }} catch {
            }
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(DetailCell.self)
        cell.viewModel = viewModel?.viewModelForItem(indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 200
    }
}

// MARK: - UITableViewDelegate
extension DetailViewController: UITableViewDelegate {
}

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
    var viewModel: DetailViewModel?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadSimilarVideoData()
        updateView()
    }

    // MARK: - Private functions
    private func configTableView() {
        tableView.register(DetailCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func updateView() {
        player.load(withVideoId: viewModel?.video?.id ?? "")
        titleYoutubeLabel.text = viewModel?.video?.title
    }

    private func loadSimilarVideoData(id: String? = nil) {
        viewModel?.loadAPIDetail(id: id) { [weak self] (result) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success:
                    this.tableView.reloadData()
                case .failure(let error):
                    this.alert(title: "Error", msg: error.localizedDescription, handler: nil)
                }
            }
        }
    }

    // MARK: - IBActions
    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
        favoriteButton.isSelected.toggle()
        do {
            let realm = try Realm()
            let data = RealmVideo()
            data.title = viewModel?.video?.title ?? ""
            data.image = viewModel?.video?.imageURL ?? ""
            try realm.write {
                realm.add(data)
            }
        } catch {
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        player.load(withVideoId: viewModel?.videos[indexPath.row].id ?? "")
        titleYoutubeLabel.text = viewModel?.videos[indexPath.row].title ?? ""
        loadSimilarVideoData(id: viewModel?.videos[indexPath.row].id)
        tableView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

// MARK: - UITableViewDelegate
extension DetailViewController: UITableViewDelegate {
}

//
//  DetailViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/12/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

final class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var player: WKYTPlayerView!
    @IBOutlet private weak var titleYoutubeLabel: UILabel!

    // MARK: - Properties
    var viewModel: DetailViewModel? {
        didSet {
           // tableView.reloadData()
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
        let nib = UINib(nibName: "DetailCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "DetailCell")
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

    private func loadData() {
        guard let viewModel = viewModel else { return }
        viewModel.loadNominationVideoAPIDetail { [weak self] (result) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success:
                    this.tableView.reloadData()
                case .failure(let error):
                    print("error\(error)")
                }
            }
        }
    }

    // MARK: - IBActions
    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? DetailCell else { return UITableViewCell() }
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

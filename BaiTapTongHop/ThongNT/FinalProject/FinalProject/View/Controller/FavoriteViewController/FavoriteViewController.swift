//
//  FavoriteViewController.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/22/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class FavoriteViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    var viewModel: FavoriteViewControllerModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configTableView()
    }

    private func setupUI() {
        title = "Favorite"
    }

    private func configTableView() {
        tableView.register(ThumbnailTableViewCell.self)
        tableView.dataSource = self
    }
}

// MARK: Extension Datasource of TableView
extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let thumbCell = tableView.dequeueReusableCell(withIdentifier: "ThumbnailTableViewCell", for: indexPath) as? ThumbnailTableViewCell else { return UITableViewCell() }
        let snippet = viewModel?.getVideo(with: indexPath.row)
        thumbCell.viewModel = ThumbnailTableViewCellModel(snippet: snippet)
        return thumbCell
    }
}

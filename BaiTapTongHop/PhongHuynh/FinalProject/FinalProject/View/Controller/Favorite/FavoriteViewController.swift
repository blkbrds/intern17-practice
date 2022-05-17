//
//  FavoriteViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class FavoriteViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "FavoriteCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "FavoriteCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FavoriteViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else { return UITableViewCell() }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }
}

extension FavoriteViewController: UITableViewDelegate {
}

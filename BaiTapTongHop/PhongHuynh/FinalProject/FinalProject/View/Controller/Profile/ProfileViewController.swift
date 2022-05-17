//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "ProfileCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "ProfileCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileCell else { return UITableViewCell() }
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
            return 40
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
}

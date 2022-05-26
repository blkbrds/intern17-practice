//
//  FavoriteViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

final class FavoriteViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: FavoriteViewModel = FavoriteViewModel()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
        let realm = try Realm()
            viewModel.videos = realm.objects(RealmVideo.self).toArray(ofType: RealmVideo.self)
            tableView.reloadData()
        } catch {

        }
    }

    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "FavoriteCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "FavoriteCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension FavoriteViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
       // cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            do {
                let realm = try Realm()
                let item = viewModel.videos[indexPath.row]
                try realm.write {
                    realm.delete(item)
                    viewModel.removeVideo(indexPath: indexPath)
                    tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                }
            } catch {
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension FavoriteViewController: UITableViewDelegate {
}


//
//  FavoriteViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

protocol FavoriteViewControllerDelegate: class {
    func controller(_ controller: FavoriteViewController, needsPerfom actions: FavoriteViewController.Action)
}

final class FavoriteViewController: UIViewController {
    
    enum Action {
        case moToDetail(id: RealmVideo, title: RealmVideo)
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: FavoriteViewModel = FavoriteViewModel()
    weak var delegate: FavoriteViewControllerDelegate?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configNavigation()
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
        tableView.register(FavoriteCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func configNavigation() {
        title = "Favorite"
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.green
    }
}

// MARK: - UITableViewDataSource
extension FavoriteViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(FavoriteCell.self)
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
        do {
            let realm = try Realm()
            let data = RealmVideo()
            if data.image.isNotEmpty && data.title.isNotEmpty {
                try realm.write {
                    realm.delete(data)
                }
            }
        } catch {
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        do {
//            let realm = try Realm()
//            let data = RealmVideo()
//            let vc = DetailViewController()
//            if let delegate = delegate {
//                delegate.controller(self, needsPerfom: .moToDetail(id: data.image, title: data.title))
//            }
//            navigationController?.pushViewController(vc, animated: true)
//        } catch {
//        }
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

//
//  DetailViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/12/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var youtubeView: UIView!
    @IBOutlet private weak var youtubeLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: DetailViewModel = DetailViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        viewModel.loadAPI { [weak self] (result) in
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
    
    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "DetailCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 200
    }
}

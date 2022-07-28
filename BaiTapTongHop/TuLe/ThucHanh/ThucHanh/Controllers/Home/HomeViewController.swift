//
//  HomeViewController.swift
//  ThucHanh
//
//  Created by tu.le2 on 20/07/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var homeTableView: UITableView!
    
    var viewModel: HomeViewModel?
    var index: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Home"
        configTableView()
        loadData()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        homeTableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    private func loadData() {
        viewModel?.loadData(completion: { result in
            switch result {
            case .success:
                homeTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        })
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowInSection(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell,
              let viewModel = viewModel else{
            return UITableViewCell()
        }
        
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func cell(cell: HomeTableViewCell, needPerform action: HomeTableViewCell.Action) {
        switch action {
        case .detailButtonPressed:
            guard let indexPath = homeTableView.indexPath(for: cell) else {
                return
            }
            let detailViewController = DetailViewController()
            let detailViewModel = viewModel?.viewModelForDetail(at: indexPath)
            detailViewController.viewModel = detailViewModel
            detailViewController.delegate = self
            index = indexPath
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension HomeViewController: DetailViewControllerDelegate {
    func view(view: DetailViewController, needPerform action: DetailViewController.Action) {
        switch action {
        case .doneButtonPressed(let user):
            viewModel?.user[index?.row ?? 0] = user.user
            homeTableView.reloadData()
        }
    }
}

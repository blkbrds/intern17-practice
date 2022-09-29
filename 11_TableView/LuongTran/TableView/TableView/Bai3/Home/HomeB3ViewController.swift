//
//  HomeB3ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class HomeB3ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var indexUser: Int = 0
    
    var viewModel: HomeB3ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        guard let viewModel = viewModel else { return }
        viewModel.loadData()
        configTableView()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewContact")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomeB3ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "tableViewContact", for: indexPath)
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailB3ViewController()
        detailVC.dataSource = self
        indexUser = indexPath.row
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeB3ViewController: DetailB3ViewControllerDataSource {
    func getData() -> String {
        guard let viewModel = viewModel else { return "" }
        return viewModel.contacts[indexUser]
    }
}

//
//  Bai2ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class Bai2ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: Bai2ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        viewModel.loadData()
        configTableView()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Define.cellName)
        tableView.dataSource = self
    }
    
}


extension Bai2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Define.cellName, for: indexPath)
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
}

extension Bai2ViewController {
    private struct Define {
        static var cellName: String = "tableViewContact"
    }
}

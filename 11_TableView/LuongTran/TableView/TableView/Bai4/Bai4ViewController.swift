//
//  Bai4ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class Bai4ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: Bai4ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        guard let viewModel = viewModel else { return }
        viewModel.loadData()
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Define.cellName)
        tableView.dataSource = self
    }
}

extension Bai4ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Define.cellName, for: indexPath)
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
}

extension Bai4ViewController {
    private struct Define {
        static var cellName: String = "tableViewContact"
    }
}

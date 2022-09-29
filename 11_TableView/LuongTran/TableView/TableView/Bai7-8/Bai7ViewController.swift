//
//  Bai7ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class Bai7ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: Bai7ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Define.title
        guard let viewModel = viewModel else { return }
        viewModel.loadData()
        configTableView()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Define.cellName)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension Bai7ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.arraySectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        let elementKey = viewModel.arraySectionTitles[section]
        if let elementValues = viewModel.arrayListIndex[elementKey] {
            return elementValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Set Style subtitle for cell
        var cell = UITableViewCell(style: .subtitle, reuseIdentifier: Define.cellName)
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let viewModel = viewModel else { return "" }
        return viewModel.arraySectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        guard let viewModel = viewModel else { return [""] }
        return viewModel.arraySectionTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

extension Bai7ViewController {
    private struct Define {
        static var title: String = "SECTIONS"
        static var cellName: String = "tableViewContact"
    }
}

//
//  Bai9ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class Bai9ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: Bai9ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Define.title
        guard let viewModel = viewModel else { return }
        viewModel.loadData()
        configTableView()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: Define.cellName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Define.cellName)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension Bai9ViewController: UITableViewDataSource, UITableViewDelegate {
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
        guard let viewModel = viewModel,
              let cell = tableView.dequeueReusableCell(withIdentifier: Define.cellName) as? Bai9TableViewCell
        else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let viewModel = viewModel else { return "" }
        return viewModel.arraySectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        guard let viewModel = viewModel else { return [] }
        return viewModel.arraySectionTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension Bai9ViewController: Bai9TableViewCellDelegate {
    func cell(cell: Bai9TableViewCell, needPerform action: Bai9TableViewCell.Action) {
        switch action {
        case .didTap:
            guard let index = tableView.indexPath(for: cell) else { return }
            print("Home Cell ---> Tap me: section \(index.section) row \(index.row)")
        }
    }
}

extension Bai9ViewController {
    private struct Define {
        static var title: String = "SECTIONS"
        static var cellName: String = String(describing: Bai9TableViewCell.self)
    }
}

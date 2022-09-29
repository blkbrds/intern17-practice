//
//  Bai1ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class Bai1ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Define.cellName)
        tableView.dataSource = self
    }
    
}

extension Bai1ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Define.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Define.cellName, for: indexPath)
        cell.textLabel?.text = "Name \(indexPath.row)"
        return cell
    }
}

extension Bai1ViewController {
    private struct Define {
        static var cellName: String = "UITableViewCell"
        static var numberOfRows: Int = 10
    }
}

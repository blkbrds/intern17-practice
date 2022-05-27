//
//  BT4ViewController.swift
//  BTTableView
//
//  Created by Tuan Tran V. VN.Danang on 5/26/22.
//

import UIKit

final class BT4ViewController: UIViewController {
    let tableView = UITableView()
    var tempData: [Dictionary<String, [String]>.Element] = .init()
    var data: [String: [String]] = [:]
    var titleTableView: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            data = try DataManager.shared().read()
            titleTableView = Array(data.keys).sorted(by: <)
        } catch {
            print(error)
        }
        configTableView()
    }
    
    private func configTableView() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension BT4ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[titleTableView[section]]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = data[titleTableView[indexPath.section]]?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleTableView[section]
    }
}

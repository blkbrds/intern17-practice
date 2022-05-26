//
//  BT3TableViewController.swift
//  BTTableView
//
//  Created by Tuan Tran V. VN.Danang on 5/26/22.
//

import UIKit

final class BT3TableViewController: UITableViewController {
    private var nameList: [String] = ["Nguyễn Văn Tèo",
                              "Lê Thị Lung Linh",
                              "Trần Văn Tủn",
                              "Trần Văn Tèo",
                              "Chí Văn Phèo",
                              "Hoàng Hí Hửng",
                              "Võ Vênh Váo",
                              "Mai Văn Mốt",
                              "Bình Thị Minh",
                              "Hoàng Văn Hôn"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        title = "Home"
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = nameList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ContactDetailViewController()
        viewController.contactName = nameList[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

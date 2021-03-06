//
//  Ex1TableViewController.swift
//  DemoTableView
//
//  Created by thuan.nguyen on 23/05/2022.
//

import UIKit

class Ex1TableViewController: UITableViewController {
    
    var userList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        loadData()
        configTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "DanhSach", withExtension: "plist"),
              let contactsData = NSArray(contentsOf: path) as? [String]
        else { return }
        userList = contactsData
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(userList[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Table2ViewController()
        vc.name = userList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}



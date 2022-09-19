//
//  HomeB3ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class HomeB3ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var contacts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        loadData()
        configTableView()
    }

    private func loadData() {
        guard let path = Bundle.main.url(forResource: "contacts", withExtension: "plist")
        else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String]
        else { return }
        contacts = contactsData
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewContact")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomeB3ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewContact", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailB3ViewController()
        detailVC.userName = contacts[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

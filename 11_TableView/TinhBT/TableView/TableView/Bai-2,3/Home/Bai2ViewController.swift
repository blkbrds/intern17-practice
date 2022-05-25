//
//  Bai2ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/19/22.
//

import UIKit

final class Bai2ViewController: UIViewController {
    
    var names: [String] = []
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        loadData()
        configTableView()
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "NamesList", withExtension: "plist")
        else { return }
        guard let namesData = NSArray(contentsOf: path) as? [String]
        else { return }
        names = namesData
    }
    
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - UITableViewDataSource
extension Bai2ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(names[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.name = names[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

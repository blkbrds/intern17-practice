//
//  Bai4ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/20/22.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    // MARK: Property
    var sections: [[String]]  = []
    var titles: [String] = ["section1", "sections2", "sections3"]
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
        loadData()
        configTableView()
    }
    
    // MARK: - Private function
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "NameList", withExtension: "plist")
        else { return }
        guard let sectionsData = NSArray(contentsOf: path) as? [[String]] else { return }
        sections = sectionsData
    }
    
    private  func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension Bai4ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = sections[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
}

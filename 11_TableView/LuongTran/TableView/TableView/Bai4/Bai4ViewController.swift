//
//  Bai4ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class Bai4ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let section0: [String] = ["Mì", "Bí"]
    private let section1: [String] = ["Heo", "Bò", "Trâu", "Ngựa", "Gà", "Vịt", "Cá"]
    private let section2: [String] = ["Tivi", "Dao", "Kéo", "Remote"]
    private var sections: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        sections = [section0, section1, section2]
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewContact")
        tableView.dataSource = self
    }
}

extension Bai4ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewContact", for: indexPath)
        cell.textLabel?.text = sections[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Section 0"
        case 1: return "Section 1"
        case 2: return "Section 2"
        default:
            return "Section Header"
        }
    }
}

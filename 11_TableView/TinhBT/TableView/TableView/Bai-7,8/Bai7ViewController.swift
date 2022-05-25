//
//  Bai7ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/23/22.
//

import UIKit

final class Bai7ViewController: UIViewController {
    
    // MARK: - Property
    var list: [[String]] = []
    var listIndex: [String] = []
    var titles: [String] = ["thucpham", "giasuc", "dovat"]
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sections"
        loadData()
        configTableView()
    }
    
    func loadData() {
        let thucPham: [String] = ["Cam", "Gao", "Muoi", "Rau", "Cu qua", "Cam", "Gao", "Muoi", "Rau", "Cu qua"]
        let giaSuc: [String] = ["Ga", "Vit", "trau", "bo", "heo", "Ga", "Vit", "trau", "bo", "heo"]
        let doVat: [String] = ["tivi", "quat", "tu lanh", "dao", "keo", "xe", "tivi", "quat", "tu lanh", "dao", "keo", "xe"]
        
        self.list = [thucPham, giaSuc, doVat]
        listIndex = ["T", "G", "D"]
    }
    
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension Bai7ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return listIndex
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int ) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.section][indexPath.row]
        
        let label = UILabel(frame: CGRect(x: 50, y: 27, width: 55, height: 13))
        label.text = "name"
        label.textColor = .red
        cell.addSubview(label)
        
        return cell
    }
}

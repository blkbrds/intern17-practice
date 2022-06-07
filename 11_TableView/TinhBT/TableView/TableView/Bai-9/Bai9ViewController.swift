//
//  Bai9ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/23/22.
//

import UIKit

final class Bai9ViewController: UIViewController {
    
    // MARK: - Properties
    var list: [[String]] = []
    var listIndex: [String] = []
    var titles: [String] = ["thucpham", "giasuc", "dovat"]
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "Bai9TableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        configTableView()
        loadData()
    }
    
    // MARK: - Private functions
    private func loadData() {
        let thucPham: [String] = ["Cam", "Gao", "Muoi", "Rau", "Cu qua", "Cam", "Gao", "Muoi", "Rau", "Cu qua"]
        let giaSuc: [String] = ["Ga", "Vit", "trau", "bo", "heo", "Ga", "Vit", "trau", "bo", "heo"]
        let doVat: [String] = ["tivi", "quat", "tu lanh", "dao", "keo", "xe", "tivi", "quat", "tu lanh", "dao", "keo", "xe"]
        
        self.list = [thucPham, giaSuc, doVat]
        listIndex = ["T", "G", "D"]
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension Bai9ViewController: UITableViewDataSource {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Bai9TableViewCell
        cell.updateTableCell(avatar: "avt", name: list[indexPath.section][indexPath.row], subTitle: "sub title")
        cell.nameLabel.textColor = .red
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension Bai9ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = Detailbai9ViewController()
        dvc.name = list[indexPath.section][indexPath.row]
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - Bai9TableViewCellDelegate
extension Bai9ViewController: Bai9TableViewCellDelegate {
    func tapMe(_ bai9TableViewCell: Bai9TableViewCell, needsPerfom actions: Bai9TableViewCell.Action) {
        switch actions {
        case .tap:
         print("aaaaaaa")
        }
    }
}
    
    


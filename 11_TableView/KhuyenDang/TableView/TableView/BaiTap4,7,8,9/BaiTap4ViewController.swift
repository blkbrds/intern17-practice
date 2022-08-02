//
//  BaiTap4ViewController.swift
//  TableView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/6/22.
//

import UIKit

final class BaiTap4ViewController: UIViewController {
    
    // MARK: - Enum
    enum TypeSection: Int {
        case food = 0
        case cattle
        case stuff
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var data: [[String]] = []
    private var indexData: [String] = []

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromPlist()
        configUITableView()
    }
    
    // MARK: - Private methods
    private func configUITableView() {
        title = "SECTIONS"
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        indexData = ["T", "G", "Đ"]
    }
    
    private func getDataFromPlist() {
        guard let path = Bundle.main.url(forResource: "Data4", withExtension: "plist") else { return}
        guard let personsData = NSArray(contentsOf: path) as? [[String]] else {
            return
        }
        data = personsData
    }
}

// MARK: - UITableViewDataSource
extension BaiTap4ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let model = InfoCell(avatar: "avatar", name: data[indexPath.section][indexPath.row], index: indexPath.row + 1, section: "\(indexPath.section + 1)")
        cell.updateTableCell(item: model)
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let typeSection = TypeSection(rawValue: section) else {
            return ""
        }
        switch typeSection {
        case .food:
            return "Thực phẩm"
        case .cattle:
            return "Gia súc"
        case .stuff:
            return "Đồ vật"
        }
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexData
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
// MARK: - UITableViewDelegate
extension BaiTap4ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CustomTableViewCellDelegate
extension BaiTap4ViewController: CustomTableViewCellDelegate {
    func cell(_ cell: CustomTableViewCell, needPerformAction action: CustomTableViewCell.Action) {
        switch action {
        case .passIndexTap(index: let index, section: let section):
            print("Tap \(index) section \(section)")
        }
    }
}

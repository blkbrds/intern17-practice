//
//  Bai4ViewController.swift
//  TableView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/6/22.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var garden: [[String]] = []
    var gardenIndex: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let nib = UINib(nibName: "CustomTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Data4", withExtension: "plist") else { return }
        guard let gardenData = NSArray(contentsOf: path) as? [[String]] else { return }
        garden = gardenData
        gardenIndex = ["T", "G", "Đ"]
    }
}

// MARK: - Extensios
extension Bai4ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return garden.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garden[section].count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.updateTableCell(avatar: "avatar.jpeg", name: garden[indexPath.section][indexPath.row], subtitle: "name", index: indexPath.row + 1, section: indexPath.section )
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Thực phẩm"
        case 1:
            return "Gia súc"
        default:
            return "Đồ vật"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension Bai4ViewController: CustomTableViewCellDelegate {
    
    func tapMe(_ customTableViewCell: CustomTableViewCell, index: Int, section: Int) {
        print("CustomTavleViewCell --> tap me section: \(section), index: \(index)")
    }
}

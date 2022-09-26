//
//  Bai7ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class Bai7ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var arrayList: [[String]] = []
    var arrayListIndex: [String: [String]] = [:]
    var arraySectionTitles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
        loadData()
        configTableView()
    }

    private func loadData() {
        let giaSuc: [String] = ["Heo", "Bò", "Trâu", "Ngựa", "Gà", "Vịt", "Cá"]
        let doVat: [String] = ["Tivi", "Dao", "Kéo", "Xe", "Chén", "Bát", "Kèn", "Búa", "Đinh"]
        let hoa: [String] = ["Hoa Hồng", "Hoa Mai", "Hoa Đào"]
        
        self.arrayList = [giaSuc, doVat, hoa]
        for array in arrayList {
            for element in array {
                let elementKey = String(element.prefix(1))
                if var elementValues = arrayListIndex[elementKey] {
                    elementValues.append(element)
                    arrayListIndex[elementKey] = elementValues
                } else {
                    arrayListIndex[elementKey] = [element]
                }
            }
        }
        arraySectionTitles = [String](arrayListIndex.keys)
        arraySectionTitles = arraySectionTitles.sorted(by: { $0 < $1 })
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewContact")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func createSubTextCell() -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 25, width: 160, height: 30)
        label.text = "Test"
        label.textColor = .red
        label.font = label.font.withSize(13)
        return label
    }
    
}

extension Bai7ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        arraySectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let elementKey = arraySectionTitles[section]
        if let elementValues = arrayListIndex[elementKey] {
            return elementValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Set Style subtitle for cell
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "tableViewContact")
        let elementKey = arraySectionTitles[indexPath.section]
        if let elementValues = arrayListIndex[elementKey] {
            cell.textLabel?.text = elementValues[indexPath.row]
            cell.contentView.addSubview(createSubTextCell())
            //add detail
            //cell.detailTextLabel?.text = "Test"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arraySectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arraySectionTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

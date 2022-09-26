//
//  Bai9ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class Bai9ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var arrayList: [[String]] = []
    private var arrayListIndex: [String: [String]] = [:]
    private var arraySectionTitles: [String] = []
    private let cellName = String(describing: Bai9TableViewCell.self)
    
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
        let nib = UINib(nibName: cellName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellName)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension Bai9ViewController: UITableViewDataSource, UITableViewDelegate {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! Bai9TableViewCell
        let elementKey = arraySectionTitles[indexPath.section]
        if let elementValues = arrayListIndex[elementKey] {
            cell.updateCell(name: elementValues[indexPath.row], subTitle: "sub title")
            cell.delegate = self
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension Bai9ViewController: Bai9TableViewCellDelegate {
    func cell(cell: Bai9TableViewCell, needPerform action: Bai9TableViewCell.Action) {
        switch action {
        case .didTap:
            guard let index = tableView.indexPath(for: cell) else { return }
            print("Home Cell ---> Tap me: section \(index.section) row \(index.row)")
        }
    }
}

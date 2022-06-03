//
//  Ex4ViewController.swift
//  ExerciseTableView
//
//  Created by thuan.nguyen on 24/05/2022.
//

import UIKit

final class Ex4ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var list: [[String]] = []
    private var listIndex: [String] = ["F", "A", "D"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
        loadData()
        configTableView()
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Listds", withExtension: "plist"),
              let contactsData = NSArray(contentsOf: path) as? [[String]]
        else { return }
        list = contactsData
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension Ex4ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Food"
        case 1: return "Animal"
        default:    return "Device"    //return "Section \(section)"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(list[indexPath.section][indexPath.row])"
        let label = UILabel(frame: CGRect(x: 40, y: 30, width: 100, height: 20))
        label.text = "Name"
        label.textColor = .red
        cell.addSubview(label)
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return listIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

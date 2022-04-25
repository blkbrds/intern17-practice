//
//  Exercise07ViewController.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class Exercise07ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var vatchat: [[String]] = [
        ["Heo", "Ga", "Vit"],
        ["Tivi", "Dao", "Keo"],
        ["Hoa1", "Hoa2", "Hoa3"]
    ]
    
    var vatchatIndex: [String] = []
    var phanloai: [String] = ["Giasuc", "Dovat", "Hoa"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "VatChat"
        tableView.delegate = self
        tableView.dataSource = self
        
        // Nib
        let nib = UINib(nibName: "NameCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    private func setupData() {
        loadData()
    }
    
    private func loadData() {
        vatchatIndex = ["G", "D", "H"]
    }
}

// MARK: - Extention UITableViewDataSource && Delegate
extension Exercise07ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        vatchat.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vatchat[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NameCell
        cell.textLabel?.text = vatchat[indexPath.section][indexPath.row]
        cell.nameLabel.text = "Name"
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return vatchatIndex
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return phanloai[section]
    }
}

//
//  Exercise09ViewController.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class Exercise09ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var names: [[String]] = []
    var teamsIndex: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        title = "Mobile Developer"
        // delegate && datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        // nib cell
        let nib = UINib(nibName: "Ex9Cell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    private func setupData() {
        loadDataPlist()
    }
    
    func loadDataPlist() {
        guard let path = Bundle.main.url(forResource: "Names", withExtension: "plist") else { return }
        guard let namesData = NSArray(contentsOf: path) as? [[String]] else { return }
        names = namesData
        teamsIndex = ["I", "F", "R"]
    }
}


// MARK: - Extention UITableViewDataSource && Delegate
extension Exercise09ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Ex9Cell
        cell.setupCell(image: UIImage(named: "ic-user"), namelb: names[indexPath.section][indexPath.row], subtitlelb: "subtitle", index: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return teamsIndex
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "iOS"
        case 1: return "Fluter"
        default: return "ReactNative"
        }
    }
}

// MARK: - Implement Protocol
extension Exercise09ViewController: Ex9CellDelegate {
    func viewCell(_ viewCell: Ex9Cell, needsPerform action: Ex9Cell.Action) {
        switch action {
        case .getData(name: let names, index: let index):
            print("\(names) : \(index)")
        }
    }
}

//
//  Exersice12ViewController.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class Exersice12ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var names: [String] = ["Tri", "Tinh", "Thuan", "Phong", "Thong"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Function
    func setupUI() {
        title = "Table reorder"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // delegate && datasource
        tableView.delegate = self
        tableView.dataSource = self

        turnOffEditingMode()
    }
        
    // MARK: - Objc
    @objc func turnOnEditingMode() {
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func turnOffEditingMode() {
        tableView.isEditing = false
        let editingButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItem = editingButton
    }
    
    func delete(indexPath: IndexPath) {
        names.remove(at: indexPath.row)
    }
    
    func insert() {
        names.append("Hona")
    }
    
}

// MARK: - Extention
extension Exersice12ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let result = indexPath.row % 3
        switch result {
        case 0: return .none
        case 1: return .delete
        default: return .insert
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .none: return
        case .delete: delete(indexPath: indexPath)
        case .insert: insert()
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = names[sourceIndexPath.row]
        delete(indexPath: sourceIndexPath)
        names.insert(itemToMove, at: destinationIndexPath.row)
    }
}

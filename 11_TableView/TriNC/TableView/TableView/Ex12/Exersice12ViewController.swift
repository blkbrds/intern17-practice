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
    var selectArr: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        title = "Table Swipe"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Delegate && Datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        // Navigation Bar
        turnOffEditingMode()
        let selectBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(selectAction))
        navigationItem.leftBarButtonItem = selectBarButtonItem
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
    
    @objc func selectAction() {
        tableView.allowsMultipleSelectionDuringEditing = true
        for row in 0..<names.count {
            self.tableView.selectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
        }
    }
    
    // MARK: - Function
    func deleteCell(indexPath: IndexPath) {
        names.remove(at: indexPath.row)
    }
    
    func insertCell() {
        names.append("Linh")
    }
    
    func selectDeselectCell(tableView: UITableView, indexPath: IndexPath) {
        if let arr = tableView.indexPathForSelectedRow {
            for _ in arr {
                selectArr.append(names[indexPath.row])
            }
        }
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
        case .delete: deleteCell(indexPath: indexPath)
        case .insert: insertCell()
        default: return
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = names[sourceIndexPath.row]
        deleteCell(indexPath: sourceIndexPath)
        names.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 1, delay: 0.2 * Double(indexPath.row), animations: {
            cell.alpha = 1
        })
    }
}

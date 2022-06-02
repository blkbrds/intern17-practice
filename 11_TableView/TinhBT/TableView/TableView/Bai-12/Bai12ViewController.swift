//
//  Bai12ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/24/22.
//

import UIKit

final class Bai12ViewController: UIViewController {
    
    // MARK: - Property
    var contacts: [String] = ["Tí",
                              "Tèo",
                              "Hùng",
                              "Lam",
                              "Thuỷ",
                              "Tuấn",
                              "Trung",
                              "Hạnh"]
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARk: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configTableView()
    }
    
    // MARK: - Private funtion
   private func configTableView()  {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configNavigationBar() {
        title = "haizz"
        turnOffEditingMode()
    }
    
    @objc private func turnOnEditingMode() {
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func turnOffEditingMode() {
        tableView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItem = editButton
    }
}

//MARK: - UITableViewDataSource
extension Bai12ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
}

//  MARK: - UITableViewDelegate
extension Bai12ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dtvc = Bai12DetailViewController()
        dtvc.name = contacts[indexPath.row]
        navigationController?.pushViewController(dtvc, animated: true)
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
        case .delete: print("delete at row\(indexPath.row)")
            if editingStyle == UITableViewCell.EditingStyle.delete {
                contacts.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        case .insert: print("insert at row\(indexPath.row)")
            if editingStyle == UITableViewCell.EditingStyle.insert {
                contacts.insert("aloooooo", at: indexPath.row)
                tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    }
}

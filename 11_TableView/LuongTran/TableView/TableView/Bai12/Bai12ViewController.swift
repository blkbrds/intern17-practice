//
//  Bai12ViewController.swift
//  TableView
//
//  Created by luong.tran on 19/09/2022.
//

import UIKit

final class Bai12ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var numbers: [String] = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    private var newNumbers: [String] = ["Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen"]
    private var selectedItems: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configTableView()
    }
    
    private func configNavigation() {
        title = Define.titleBar
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpInside))
        let insertButton = UIBarButtonItem(title: "Insert", style: .plain, target: self, action: #selector(insertButtonTouchUpInside))
        navigationItem.rightBarButtonItems = [editButton, insertButton]
        let deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteButtonTouchUpInside))
        navigationItem.leftBarButtonItem = deleteButton
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewB12")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
    }
    
    private func animationLoadTable() {
        UIView.transition(with: tableView,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() })
    }
    
    @objc private func insertButtonTouchUpInside() {
        let textVC = TextViewController()
        textVC.delegate = self
        navigationController?.pushViewController(textVC, animated: true)
    }
    
    @objc private func editButtonTouchUpInside(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
        if tableView.isEditing {
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(editButtonTouchUpInside))
            navigationItem.rightBarButtonItem = doneButton
        } else {
            let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpInside))
            navigationItem.rightBarButtonItem = editButton
        }
    }
    
    @objc private func deleteButtonTouchUpInside(_ sender: Any) {
        numbers = numbers
            .enumerated()
            .filter { !selectedItems.contains($0.offset) }
            .map { $0.element }
        selectedItems.removeAll()
        animationLoadTable()
    }
    
}

extension Bai12ViewController: UITableViewDataSource, UITableViewDelegate, UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = numbers[indexPath.row]
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numbers.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewB12", for: indexPath)
        if let id = numbers[safe: indexPath.row] {
            cell.textLabel?.text = "Number \(id)"
            if selectedItems.contains(indexPath.row) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedItems.contains(indexPath.row) {
            guard let index = selectedItems.firstIndex(of: indexPath.row) else { return }
            selectedItems.remove(at: index)
        } else {
            selectedItems.append(indexPath.row)
        }
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.tableView.beginUpdates()
            self.numbers.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .left)
            self.tableView.endUpdates()
            completionHandler(true)
        }
        delete.backgroundColor = .red
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = numbers[sourceIndexPath.row]
        numbers.remove(at: sourceIndexPath.row)
        numbers.insert(itemToMove, at: destinationIndexPath.row)
    }
}

extension Bai12ViewController: TextViewControllerDelegate {
    func vc(vc: TextViewController, needPerform action: TextViewController.Action) {
        switch action {
        case .senData(data: let data):
            numbers.append(data)
            animationLoadTable()
        }
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Bai12ViewController {
    private struct Define {
        static var titleBar = "Table reorder"
    }
}

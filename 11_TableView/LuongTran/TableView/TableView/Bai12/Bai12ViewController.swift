//
//  Bai12ViewController.swift
//  TableView
//
//  Created by luong.tran on 19/09/2022.
//

import UIKit

final class Bai12ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: Bai12ViewModel?
    
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Define.cellName)
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
        textVC.viewModel = TextViewModel(data: "")
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
        guard let viewModel = viewModel else { return }
        viewModel.numbers = viewModel.numbers
            .enumerated()
            .filter { !viewModel.selectedItems.contains($0.offset) }
            .map { $0.element }
        viewModel.selectedItems.removeAll()
        animationLoadTable()
    }
    
}

extension Bai12ViewController: UITableViewDataSource, UITableViewDelegate, UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        guard let viewModel = viewModel else { return [] }
        dragItem.localObject = viewModel.numbers[indexPath.row]
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numbers.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Define.cellName, for: indexPath)
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        if viewModel.selectedItems.contains(indexPath.row) {
            guard let index = viewModel.selectedItems.firstIndex(of: indexPath.row) else { return }
            viewModel.selectedItems.remove(at: index)
        } else {
            viewModel.selectedItems.append(indexPath.row)
        }
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let viewModel = viewModel else { return UISwipeActionsConfiguration() }
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            tableView.beginUpdates()
            viewModel.numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            tableView.endUpdates()
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
        guard let viewModel = viewModel else { return }
        let itemToMove = viewModel.numbers[sourceIndexPath.row]
        viewModel.numbers.remove(at: sourceIndexPath.row)
        viewModel.numbers.insert(itemToMove, at: destinationIndexPath.row)
    }
}

extension Bai12ViewController: TextViewControllerDelegate {
    func vc(vc: TextViewController, needPerform action: TextViewController.Action) {
        switch action {
        case .senData(data: let data):
            guard let viewModel =  viewModel else {
                return
            }
            viewModel.updateArray(data: data)
            tableView.reloadData()
        }
    }
}

extension Bai12ViewController {
    private struct Define {
        static var titleBar: String = "Table reorder"
        static var cellName: String = "tableViewB12"
    }
}

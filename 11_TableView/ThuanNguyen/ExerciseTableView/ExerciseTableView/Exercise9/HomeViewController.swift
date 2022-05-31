//
//  HomeViewController.swift
//  ExerciseTableView
//
//  Created by thuan.nguyen on 24/05/2022.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    
    private var list: [[String]] = []
    private var listIndex: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table reoder"
        setupNavigitionBar()
        configTableView()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func setupNavigitionBar() {
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func rightAction() {
        tableView.isEditing = !tableView.isEditing
    }
    
    func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "ListTH", withExtension: "plist")
        else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [[String]]
        else { return }
        list = contactsData
        listIndex = ["F", "A", "D"]
    }
}
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return section.description
        switch section {
        case 0: return "Food"
        case 1: return "Animal"
        default:    return "Device"    //return "Section \(section)"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return listIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = list[indexPath.section][indexPath.row]
        cell.nameLabel.textColor = .red
        cell.subtitleLable.text = "SubTitle"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //delete
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            let section = indexPath.section
            let row = self.list[section][indexPath.row]
            tableView.beginUpdates()
            self.list[section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()

            completionHandler(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .systemRed
        
        // swipe
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe

    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let section = sourceIndexPath.section
        let itemsMove = list[section][sourceIndexPath.row]
        list[section].remove(at: sourceIndexPath.row)
        list[destinationIndexPath.section].insert(itemsMove, at: destinationIndexPath.row)
        
    }
}

import UIKit

final class Bai12ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var nameData: [String] = ["Two", "Tree", "Four", "Five"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate  = self
        turnOffEditingMode()
    }
    
    // MARK: - Objc functions
    @objc private func turnOnEditingMode() {
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func turnOffEditingMode() {
        tableView.isEditing = false
        let editingButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItem = editingButton
    }
    
    // MARK: - Private functions
    private func insert() {
        nameData.append("Six")
    }
    
    private func delete(indexPath: IndexPath) {
        nameData.remove(at: indexPath.row)
    }
}

// MARK: - UITableViewDataSource
extension Bai12ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(nameData[indexPath.row])"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension Bai12ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let result = indexPath.row % 3
        switch result {
        case 0: return .insert
        case 1: return .none
        default: return .delete
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert: insert()
        case .none: return
        case .delete: delete(indexPath: indexPath)
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = nameData[sourceIndexPath.row]
        delete(indexPath: sourceIndexPath)
        nameData.insert(itemToMove, at: destinationIndexPath.row)
    }
}

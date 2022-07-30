import UIKit

final class BT5ViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    let cell: String = "tableViewCell"
    var contactsData: [String] = []
    var persons: [String] = ["Nguyễn Nhật Quyên", "Lê Công Tú", "Nguyễn Thường Tính", "Đoàn Trần Hiếu My", "Đoàn Hà Vương", "Trần Văn Trung", "Đặng Thanh Thuận", "Đặng Như Quỳnh", "Đặng Quỳnh Như"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configSearchBar()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableView.delegate = self
        tableView.dataSource = self
        contactsData = persons
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func search(keyword: String) {
        contactsData = getContacts(keyword: keyword)
        tableView.reloadData()
    }
    
    private func getContacts(keyword: String) -> [String] {
        if keyword.isEmpty {
            return persons
        } else {
            var data: [String] = []
            for contact in persons {
                if let _ = contact.range(of: keyword){
                    data.append(contact)
                }
            }
            return data
        }
    }
}

extension BT5ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        cell.textLabel?.text = contactsData[indexPath.row]
        return cell
    }
}

extension BT5ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(keyword: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyword)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
        view.endEditing(true)
    }
}

//
//  TestViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/19/22.
//

import UIKit

final class Bai5ViewController: UIViewController {
    
    // MARK: - Properties
    var namesData: [String] = ["Bình", "Khánh", "Toàn", "Tâm", "An", "Hương", "Huy", "Quang", "Vân", "Đài", "Tiến"]
    var namesNew: [String] = []
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        namesNew = namesData
        configTableView()
        configSearchBar()
        searchBar.showsCancelButton = true
    }
    
    // MARK: - Private functions
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func search(keywork: String) {
        namesNew = getData(keywork: keywork)
        tableView.reloadData()
    }
    
    private func getData(keywork: String) -> [String] {
        if keywork.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return namesData
        } else {
            var data: [String] = []
            for name in namesData {
                if let _ = name.range(of: keywork) {
                    data.append(name)
                }
            }
            return data
        }
    }
}

//MARK: - UITableViewDelegate & UITableViewDataSource
extension Bai5ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesNew.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = namesNew[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell: \(namesNew[indexPath.row])")
        let vc = Detail5ViewController()
        vc.name = namesNew[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UISearchBarDelegate
extension Bai5ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keywork = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keywork: keywork)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keywork: "")
            return
        }
        search(keywork: keyWord)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keywork: "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            namesNew = namesData
            tableView.reloadData()
        }
    }
}

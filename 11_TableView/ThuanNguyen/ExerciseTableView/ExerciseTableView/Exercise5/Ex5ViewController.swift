//
//  Ex5ViewController.swift
//  ExerciseTableView
//
//  Created by thuan.nguyen on 24/05/2022.
//

import UIKit


class Ex5ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var listname: [String] = []
    private var name: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
        configSearchBar()
        
    }
    func loadData() {
        guard let path = Bundle.main.url(forResource: "ListName", withExtension: "plist")
        else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String]
        else { return }
        listname = contactsData
        name = contactsData
    }
    
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        
    }
    func configSearchBar() {
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        //searchBar.showsSearchButton = true
    }
    func search(keyword: String) {
        name = getList(keyword: keyword)
        tableView.reloadData()
    }
    func getList(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: "")) == "" {
            return listname
        }else {
            var data: [String] = []
            for i in listname {
                if let _ = i.range(of: keyword) {
                    data.append(i)
                }
            }
            return data
        }
    }
}
extension Ex5ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(name[indexPath.row])"
        return cell
    }
}
extension Ex5ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}



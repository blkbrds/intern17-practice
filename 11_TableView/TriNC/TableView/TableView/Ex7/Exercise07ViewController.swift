//
//  Exercise07ViewController.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class Exercise07ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var contactIndex: [String] = []
    var contacts: [[String]] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Sections"
        tableView.delegate = self
        tableView.dataSource = self
        
        // Nib
        let nib = UINib(nibName: "NameCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    private func setupData() {
        loadData()
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist") else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [[String]] else { return }
        contacts = contactsData
        contactIndex = ["A", "M", "L"]
    }
}

// MARK: - Extention UITableViewDataSource && Delegate
extension Exercise07ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Arsenal"
        case 1: return "Manchester"
        default: return "Liverpool"
        }
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.section][indexPath.row]
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return contactIndex
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

//
//  Ex11ViewController.swift
//  ExerciseTableView
//
//  Created by thuan.nguyen on 25/05/2022.
//

import UIKit

class Ex11ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    
    let content: [String] = ["Ten horses:  horse horse horse horse horse horse horse horse horse horse ",
                             "Three cows:  cow, cow, cow",
                             "One camel:  camel",
                             "Ninety-nine sheep:  sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep baaaa sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep",
                             "Thirty goats:  goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat "]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        // Along with auto layout, these are the keys for enabling variable cell height
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.lineBreakMode = .byCharWrapping
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(content[indexPath.row])"
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}

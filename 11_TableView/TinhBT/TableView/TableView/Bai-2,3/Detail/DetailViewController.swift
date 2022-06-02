//
//  DetailViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/20/22.
//

import UIKit

final class DetailViewController: UIViewController {
      
    // MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Property
    var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        nameLabel.text = name
    }
}

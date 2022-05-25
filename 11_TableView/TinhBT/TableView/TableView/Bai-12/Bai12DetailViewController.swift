//
//  Bai12DetailViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/24/22.
//

import UIKit

final class Bai12DetailViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        nameLabel.text = name
        nameLabel.textColor = .red
    }


}

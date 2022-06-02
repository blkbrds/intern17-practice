//
//  Detail5ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/20/22.
//

import UIKit

final class Detail5ViewController: UIViewController {

    // MARK: Property
    var name: String = ""
    
     // MARK: - IBOutlet
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        nameLabel.text = name
    }
}

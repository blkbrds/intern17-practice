//
//  Table2ViewController.swift
//  DemoTableView
//
//  Created by thuan.nguyen on 24/05/2022.
//

import UIKit

class Table2ViewController: UIViewController {
    
    @IBOutlet weak var nameLable: UILabel!
    
    var name: String = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DETAIL"
        nameLable.text = name
    }
}

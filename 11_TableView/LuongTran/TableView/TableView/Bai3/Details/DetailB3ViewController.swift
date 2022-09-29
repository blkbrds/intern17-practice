//
//  DetailB3ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

protocol DetailB3ViewControllerDataSource: AnyObject {
    func getData() -> String
}

final class DetailB3ViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    weak var dataSource: DetailB3ViewControllerDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DETAIL"
        guard let dataSource = dataSource else { return }
        nameLabel.text = dataSource.getData()
    }

}

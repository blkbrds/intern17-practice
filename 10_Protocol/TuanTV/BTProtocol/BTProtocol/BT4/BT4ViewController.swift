//
//  BT4ViewController.swift
//  BTProtocol
//
//  Created by Tuan Tran V. VN.Danang on 5/25/22.
//

import UIKit

final class BT4ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var listTextView: UITextView!
    
    //MARK: - IBActions
    @IBAction func cancelTapped(_ sender: UIButton) {
        print("cancel")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

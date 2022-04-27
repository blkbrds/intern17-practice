//
//  SearchTailViewController.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

// MARK: - Protocol
protocol SearchDetailViewControllerDelegate: class {
    func controller(controller: SearchTailViewController, needsPerform action: SearchTailViewController.Action)
}

final class SearchTailViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: SearchDetailViewControllerDelegate?
    var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        nameLabel.text = name
        delegate?.controller(controller: self, needsPerform: .reload)
    }
}

// MARK: - Extention
extension SearchTailViewController {
    // MARK: - Define
    enum Action {
        case reload
    }
}

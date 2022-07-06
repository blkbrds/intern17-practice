//
//  SearchViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/4/22.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var listLocationTextView: UITextView!
    
    // MARK: - Properties
    var location: [String] = [] {
        didSet {
            showList()
        }
    }
    var listLocation: [String] = ["Hoà Bình", "Điện Biên", "Sơn La", "Lai Châu", "Lào Cai", "Yên Bái", "Phú Thọ"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configSearchBar()
    }
    
    // MARK: - Private functions
    private func configUI() {
        listLocationTextView.text = ""
        for location in listLocation {
            listLocationTextView.text += "- " + location + "\n"
        }
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func showList() {
        listLocationTextView.text = ""
        for location in location {
            listLocationTextView.text += "- " + location + "\n"
        }
    }
    
    private func search(keyword: String) {
        location = getContacts(keyword: keyword)
    }
    
    private func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return listLocation
        } else {
            var data: [String] = []
            for contract in listLocation {
                if let _ = contract.range(of: keyword){
                    data.append(contract)
                }
            }
            return data
        }
    }
    
    // MARK: - IBActions
    @IBAction private func cancelButtonTouchUpInside(_ sender: Any) {
        search(keyword: "")
        searchBar.text = ""
    }
}

// MARK: - Extensions
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(keyword: searchText)
    }
}


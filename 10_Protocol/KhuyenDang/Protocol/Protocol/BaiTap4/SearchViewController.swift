//
//  SearchViewController.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/4/22.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var listTextView: UITextView!
    @IBOutlet private weak var cancelButton: UIButton!
    
    // MARK: - Properties
    var result: [String] = [] {
        didSet {
            showData()
        }
    }
    var Provinces: [String] = ["Hoà Bình", "Sơn La", "Điện Biên", "Lai Châu", "Lào Cai", "Yên Bái", "Phú Thọ", "Hà Giang", "Tuyên Quang", "Cao Bằng", "Bắc Cạn", "Thái Nguyên"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configSearchBar()
    }
    
    // MARK: - Private methods
    private func showData() {
        listTextView.text = ""
        for res in result {
            listTextView.text += "- " + res + "\n"
        }
    }
    
    private func configUI() {
        listTextView.text = ""
        cancelButton.layer.cornerRadius = 10
        for province in Provinces {
            listTextView.text += "- " + province + "\n"
        }
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func search(keyWord: String) {
        result = getProvinces(keyWord: keyWord)
    }
    
    private func getProvinces(keyWord: String) -> [String] {
        if keyWord.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return Provinces
        } else {
            var data: [String] = []
            for province in Provinces {
                if let _ = province.range(of: keyWord) {
                    data.append(province)
                }
            }
            return data
        }
    }
    
    // MARK: - IBAction
    @IBAction private func cancelButtonTouchUpInside(_ sender: Any) {
        search(keyWord: "")
        searchBar.text = ""
    }
}

// MARK: - Extension
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(keyWord: searchText)
    }
}

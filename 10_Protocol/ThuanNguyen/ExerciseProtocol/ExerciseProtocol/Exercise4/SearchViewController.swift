//
//  SearchViewController.swift
//  DemoProtocol
//
//  Created by thuan.nguyen on 20/05/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var textView: UITextView!
    
    var text: String = ""
    var searchActive : Bool = false
    var datas = ["Hoà Bình","Sơn La", "Điện Biên", "Lai Châu", "Lào Cai", "Yên Bái", "Phú Thọ", "Hà Giang", "Tuyên Quang", "Cao Băng", "Thái Nguyên", "Lạng Sơn", "Bắc Giang", "Quảng Ninh", "Hà Nội", "Đà Nẵng", "Hồ Chí Minh"]
    var filtered: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showTextView()
        searchBar.delegate = self
    }
    
    private func setupUI() {
        searchBar.showsCancelButton = true
    }
    
    private func showTextView() {
        
        for i in datas {
            text.append(contentsOf: "- \(i)\n")
        }
        textView.text = text
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        showTextView()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        text = ""
        for data in datas {
            if data.contains(searchText) {
                text.append(contentsOf: "- \(data)\n")
            }
        }
        textView.text = text
    }
}

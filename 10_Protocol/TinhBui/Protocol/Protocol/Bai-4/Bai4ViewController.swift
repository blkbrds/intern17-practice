//
//  Bai4ViewController.swift
//  Protocol
//
//  Created by Tinh Bui T. VN.Danang on 5/17/22.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var listTextView: UITextView!
    
    // MARK: - Properties
    var contacts: [String] = [] {
        didSet {
            updateData()
        }
    }
    var data: [String] = ["Hòa Bình", "Sơn La", "Điện Biên", "Lai Châu", "Lào Cai", "Yên Bái", "Phú Thọ", "Hà Giang", "Tuyên Quang", "Cao Bằng", "Bắc Cạn", "Thái Nguyên", "Lạng Sơn", "Bắc Giang", "Quảng Ninh", "Hà Nội", "Bắc Ninh", "Hà Nam", "Hải Dương", "Hải Phòng", "Hưng Yên", "Nam Định", "Thái Bình", "Vĩnh Phúc", "Ninh Bình", "Thanh Hóa"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showTextView()
        configSearchBar()
        searchBar.showsCancelButton = true
    }
    
    // MARK: - Private functions
    private func showTextView() {
        var text: String = ""
        for i in data {
            text += "- \(i) \n"
        }
        listTextView.text = text
    }
    
    private func updateData() {
        var text: String = ""
        for i in contacts {
            text += "- \(i) \n"
        }
        listTextView.text = text
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func search(keyword: String ) {
        contacts = getContacts(keyword: keyword)
    }
    
    private func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn:  " " )) == "" {
            return data
        } else {
            var newData: [String] = []
            for contact in data {
                if let _ = contact.range(of: keyword) {
                    newData.append(contact)
                }
            }
            return newData
        }
    }
}

// MARK: - UISearchBarDelegate
extension Bai4ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keywork = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keywork)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}

//
//  BT4ViewController.swift
//  BTProtocol
//
//  Created by Tuan Tran V. VN.Danang on 5/25/22.
//

import UIKit

final class BT4ViewController: UIViewController {
    
    //MARK: Property
    var cityList: [String] = ["Hoà Bình", "Sơn La", "Điện Biên", "Lai Châu", "Lào Cai", "Yên Bái", "Phú Thọ", "Hà Giang", "Tuyên Quang", "Cao Bằng", "Bắc Cạn", "Thái Nguyên", "Lạng Sơn", "Bắc Giang", "Quảng Ninh", "Hà Nội", "Bắc Ninh", "Hà Nam", "Hải Dương", "Hải Phòng", "Hưng Yên", "Nam Định", "Thái Bình", "Vĩnh Phúc", "Ninh Bình", "Thanh Hoá"]
    var tempCityList: [String] = [] {
        didSet {
            stringDisplay = ""
            for city in tempCityList {
                stringDisplay = stringDisplay + "- \(city)\n"
            }
            listTextView.text = stringDisplay
        }
    }
    var stringDisplay: String = ""
    
    //MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var listTextView: UITextView!
    
    //MARK: - IBActions
    @IBAction private func cancelTapped(_ sender: UIButton) {
        tempCityList = cityList
        searchBar.text = ""
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tempCityList = cityList
    }
}

extension BT4ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty == false {
            tempCityList = cityList.filter({$0.contains(searchText)})
        } else {
            tempCityList = cityList
        }
    }
}

//
//  BT4ViewController.swift
//  BTProtocol
//
//  Created by Tuan Tran V. VN.Danang on 5/25/22.
//

import UIKit

final class BT4ViewController: UIViewController, UISearchBarDelegate {
    
    //MARK: Property
    var cityList: [String] = ["Hoà Bình", "Sơn La", "Điện Biên", "Lai Châu", "Lào Cai", "Yên Bái", "Phú Thọ", "Hà Giang", "Tuyên Quang", "Cao Bằng", "Bắc Cạn", "Thái Nguyên", "Lạng Sơn", "Bắc Giang", "Quảng Ninh", "Hà Nội", "Bắc Ninh", "Hà Nam", "Hải Dương", "Hải Phòng", "Hưng Yên", "Nam Định", "Thái Bình", "Vĩnh Phúc", "Ninh Bình", "Thanh Hoá"]
    var tempCityList: [String] = [] {
        didSet {
            // Khi thay đổi du lieu temp thi chuyen qua set string Display
            stringDisplay = ""
            for city in tempCityList {
                stringDisplay = stringDisplay + "- \(city)\n"
            }
            listTextView.text = stringDisplay
        }
    }
    var stringDisplay: String = ""
    
    //MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var listTextView: UITextView!
    
    //MARK: - IBActions
    @IBAction func cancelTapped(_ sender: UIButton) {
        print("cancel")
        tempCityList = cityList
        searchBar.text = ""
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tempCityList = cityList
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.isEmpty == false {
            tempCityList = cityList.filter({$0.contains(searchText)})
        } else {
            tempCityList = cityList
        }
    }
}
//
//  Bai4ViewController.swift
//  Protocol
//
//  Created by luong.tran on 15/09/2022.
//

import UIKit

final class Bai4ViewController: UIViewController {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var listTextView: UITextView!
    
    private var newArray: [String] = []
    
    private var listProvinces: [String] = ["An Giang", "Bà Rịa-Vũng Tàu", "Bạc Liêu", "Bắc Kạn", "Bắc Giang", "Bắc Ninh", "Bến Tre", "Bình Dương", "Bình Định", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Cần Thơ", "Đà Nẵng", "Đắk Lắk", "Đăk Nông", "Điện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Nội", "Hà Tĩnh", "Hải Dương", "Hải Phòng", "Hậu Giang", "Hòa Bình", "Thành phố Hồ Chí Minh", "Hưng Yên", "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn", "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Phú Yên", "Quảng Bình", "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng", "Sơn La", "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hóa", "Thừa Thiên-Huế", "Tiền Giang", "Trà Vinh", "Tuyên Quang", "Vĩnh Long", "Vĩnh Phúc", "Yên Bái"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        configDataTextView()
    }
    
    private func configDataTextView() {
        var splitArray: String = ""
        for province in listProvinces {
            splitArray += "- \(province) \n\n"
            listTextView.text = splitArray
        }
    }
    
}

extension Bai4ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        newArray = listProvinces.filter({$0.prefix(searchText.count) == searchText})
        var splitArray: String = ""
        for province in newArray {
            splitArray += "- \(province) \n\n"
        }
        listTextView.text = splitArray
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text? = ""
        configDataTextView()
    }
}

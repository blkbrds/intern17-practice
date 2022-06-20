//
//  MyView.swift
//  Demo
//
//  Created by Tien Le P. VN.Danang on 6/16/22.
//

import UIKit

// Load Nib name --> XIB
// Sự kiện người dùng:
// + IBAction
// + Touch Event
// + Gesture
// + Delegate


// Khai báo thêm 1 protocol --> Delegate là Protocol
protocol MyViewDelegate: AnyObject {
    func myView(didSeletedWith myView:MyView, name: String, index: Int)
    func selected(name: String, index: Int)
}

class MyView : UIView {
    @IBOutlet weak var nameLabel: UILabel!
    var index = 0
    
    // tạo 1 thuộc tính delegate
    // Tạo con trỏ cha trong lớp con
    var delegate: MyViewDelegate? // đại diện cho HomeVC
    
    
    @IBAction func tap(_ sender: Any) {
        // Chiều Còn về cha
        print("MyView --> Ahihi")
        
        // gọi function của delegate ==> hay chính xác là gọi function đã được định nghĩa lại ở lớp cha
        if let delegate = delegate {
            delegate.selected(name: nameLabel.text ?? "n/a", index: index)
        }
    }
    
}

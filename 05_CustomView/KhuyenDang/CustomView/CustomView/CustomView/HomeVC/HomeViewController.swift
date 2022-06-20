//
//  HomeViewController.swift
//  Demo
//
//  Created by Tien Le P. VN.Danang on 6/16/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // load nib name lên
        // 1. Tạo đối tượng
        let myView = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.first as! MyView // UIView --> MyView
        
        // 2. Xét Frame
        //    + Frame là tọa độ & kích thước của View so với View cha (superView) của nó.
        let frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        
        // 3. Xét thuộc tính
        // Chiều Cha --> Con
        myView.nameLabel.text = "Anh Tiến"
        myView.backgroundColor = .blue
        myView.frame = frame
        myView.index = 100000
        
        // xét thuộc tính
        myView.delegate = self // đối tượng ViewController
        
        // 4. AddSubView
        //    UIView nào đó --> 2 điều:
        //       - Mình có thể add nó vào một View khác (View cha)
        //       - Mình có thể add cho nó nhiều view con (subviews)
        self.view.addSubview(myView)
        
        
    }


}

// Conform Protocol cho ViewController --> biến từ đơn thừa kế thành đa thừa kế
extension HomeViewController: MyViewDelegate {
    func myView(didSeletedWith myView: MyView, name: String, index: Int) {
        print("HomeVC 1 --> \(name) + \(index)")
    }

    func selected(name: String, index: Int) {
        print("HomeVC 2 --> \(name) + \(index)")
    }
}



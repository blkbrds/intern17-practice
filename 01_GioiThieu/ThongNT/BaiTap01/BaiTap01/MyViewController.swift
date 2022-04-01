//
//  MyViewController.swift
//  BaiTap01
//
//  Created by Thong Nguyen T. VN.Danang on 3/24/22.
//

import UIKit

class MyViewController: UIViewController {

    let tapBtn = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 50)))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tapBtn.backgroundColor = .systemPink
        tapBtn.setTitle("TAP", for: .normal)
        tapBtn.layer.cornerRadius = 5
        tapBtn.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(tapBtn)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tapBtn.center = view.center
    }
    
    @objc func buttonDidClick() {
        view.backgroundColor = UIColor(red: CGFloat(Float.random(in: 0...1)), green: CGFloat(Float.random(in: 0...1)), blue: CGFloat(Float.random(in: 0...1)), alpha: 1)
    }

}

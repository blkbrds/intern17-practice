//
//  BaiTap01ViewController.swift
//  BaiTap01
//
//  Created by tri.nguyen on 24/03/2022.
//

import UIKit

class BaiTap01ViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 50, height: 100)))
        button.setTitle("Tap", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    // Objc
    @objc func tapButton() {
        let random = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        view.backgroundColor = random
    }
    
        
}

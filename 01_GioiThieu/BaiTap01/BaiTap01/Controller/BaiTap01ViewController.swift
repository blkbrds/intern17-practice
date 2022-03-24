//
//  BaiTap01ViewController.swift
//  BaiTap01
//
//  Created by tri.nguyen on 24/03/2022.
//

import UIKit

class BaiTap01ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tapButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapButton.layer.cornerRadius = 10.0
    }
    
    // MARK: - IBActions
    @IBAction func tapButtonTouchUpInside(_ sender: Any) {
        self.view.backgroundColor = self.backgroundColorRandom()
    }
    
    // MARK: - Method
    func backgroundColorRandom() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
}

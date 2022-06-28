//
//  Bai12ViewController.swift
//  Autolayout
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/27/22.
//

import UIKit

final class Bai12ViewController: UIViewController {
    
    @IBOutlet var collectionButton: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI(){
        for i in collectionButton {
            i.layer.borderWidth = 0.5
            i.layer.borderColor = UIColor.gray.cgColor
        }
    }
}

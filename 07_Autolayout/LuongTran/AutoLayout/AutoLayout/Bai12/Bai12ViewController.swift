//
//  Bai12ViewController.swift
//  AutoLayout
//
//  Created by luong.tran on 08/09/2022.
//

import UIKit

final class Bai12ViewController: UIViewController {
    
    
    @IBOutlet private var caculatorButton: [UIButton]!
    @IBOutlet private var numberButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }

    private func configUI() {
        for i in 0..<caculatorButton.count {
            caculatorButton[i].layer.borderWidth = 1.0
            caculatorButton[i].layer.borderColor = UIColor.black.cgColor
        }
        for i in 0..<numberButton.count {
            numberButton[i].layer.borderWidth = 1.0
            numberButton[i].layer.borderColor = UIColor.black.cgColor
        }
    }
    
}

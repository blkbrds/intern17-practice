//
//  CalculatorViewController.swift
//  Autolayout1
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/27/22.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    @IBOutlet private var collectionButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI()
    {
        for i in collectionButton {
            i.layer.borderWidth = 0.5
            i.layer.borderColor = UIColor.gray.cgColor
        }
    }
}

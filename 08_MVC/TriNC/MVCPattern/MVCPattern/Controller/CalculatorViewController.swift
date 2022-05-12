//
//  CalculatorViewController.swift
//  MVCPattern
//
//  Created by tri.nguyen on 12/05/2022.
//

import UIKit

final class CalculatorViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action
    @IBAction func numberPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        resultLabel.text = String(tag - 1)
    }
}

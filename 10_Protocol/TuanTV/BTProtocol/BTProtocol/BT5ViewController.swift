//
//  BT5ViewController.swift
//  BTProtocol
//
//  Created by Tuan Tran V. VN.Danang on 5/25/22.
//

import UIKit

class BT5ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var firstOperandTextField: UITextField!
    @IBOutlet weak var secondOperandTextField: UITextField!
    
    @IBOutlet weak var calculatorButton: UIButton!
    //MARK: -IBActions
    @IBAction func performCalculator(_ sender: UIButton) {
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(radius: 10, color: .green, borderWidth: 1)
    }
    
    private func setupView(radius: CGFloat, color: UIColor, borderWidth: CGFloat) {
        firstOperandTextField.layer.cornerRadius = radius
        firstOperandTextField.layer.borderColor = color.cgColor
        firstOperandTextField.layer.borderWidth = borderWidth
        secondOperandTextField.layer.cornerRadius = radius
        secondOperandTextField.layer.borderColor = color.cgColor
        secondOperandTextField.layer.borderWidth = borderWidth
        calculatorButton.layer.cornerRadius = radius
        
    }
    
}

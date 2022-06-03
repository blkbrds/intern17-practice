//
//  Bai5ViewController.swift
//  Protocol
//
//  Created by Tinh Bui T. VN.Danang on 5/18/22.
//

import UIKit

final class Bai5ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var hoiButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Properties
    var customView = CustomView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorderColor()
        addCustomView()
        customView.delegate = self
        customView.datasource = self
    }
    
    // MARK: - Private functions
    private func addCustomView() {
        guard let customView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView else { return }
        self.customView = customView
        customView.frame = CGRect(x: 0, y: view.bounds.maxY / 3, width: view.bounds.width, height: view.bounds.height - customView.bounds.height)
        view.addSubview(customView)
        customView.layer.borderWidth = 2
        customView.layer.borderColor = UIColor.black.cgColor
        customView.isHidden = true
    }
    
    private func setBorderColor() {
        number1TextField.layer.borderWidth = 1.0
        number2TextField.layer.borderWidth = 1.0
        number1TextField.layer.borderColor = UIColor.blue.cgColor
        number2TextField.layer.borderColor = UIColor.blue.cgColor
    }
    
    // MARK: - IBActions
    @IBAction func hoiButtonTouchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.customView.isHidden = false
        }
        customView.getDatas()
    }
}

// MARK: - CustomViewDatasource
extension Bai5ViewController: CustomViewDatasource {
    func getData() -> (x: String, y: String) {
        guard let x = number1TextField.text, let y = number2TextField.text
        else { return ("0","0") }
        return (x, y)
    }
}

// MARK: - CustomViewDelegate
extension Bai5ViewController: CustomViewDelegate {
    func view(view: CustomView, needsPerfom actions: CustomView.Action) {
        switch actions {
        case .cancel:
            UIView.animate(withDuration: 0.2) {
                self.customView.isHidden = true
            }
        case .done(let result):
            resultLabel.text = result
            UIView.animate(withDuration: 0.2) {
                self.customView.isHidden = true
            }
        case .clear(x: let x, y: let y):
            number1TextField.text = x
            number2TextField.text = y
            UIView.animate(withDuration: 0.2) {
                self.customView.isHidden = true
            }
        }
    }
}

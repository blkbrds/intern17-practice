//
//  ViewController.swift
//  Protocol
//
//  Created by luong.tran on 15/09/2022.
//

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet private weak var valueATextField: UITextField!
    @IBOutlet private weak var valueBTextField: UITextField!
    @IBOutlet private weak var fillOperateButton: UIButton!
    
    private var customView: Calculator = (UINib(nibName: "Calculator", bundle: .main).instantiate(withOwner: ViewController.self).first as? Calculator)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        hideCustomView()
    }

    private func configUI() {
        configTextField()
        fillOperateButton.layer.cornerRadius = Define.borderRadius
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func showCustomView() {
        UIView.animate(withDuration: 0.4, delay: 0 , options: .curveEaseOut, animations: { [self] in
            customView.frame = CGRect(x: view.frame.minX, y: view.frame.midY, width: view.frame.width, height: 500)
            customView.delegate = self
            customView.dataSource = self
            self.view.addSubview(customView)
        }, completion: nil)
    }
    
    func hideCustomView() {
        UIView.animate(withDuration: Define.durationAnimation, delay: Define.delayAnimation, options: .curveEaseOut, animations: { [self] in
            customView.frame = CGRect(x: view.frame.minX, y: view.frame.maxY, width: view.frame.width, height: 500)
            self.view.addSubview(customView)
        }, completion: nil)
    }
    
    private func configTextField() {
        valueATextField.layer.borderWidth = Define.borderWitdth
        valueATextField.layer.borderColor = Define.colorWidth
        valueATextField.layer.cornerRadius = Define.borderRadius
        valueBTextField.layer.borderWidth = Define.borderWitdth
        valueBTextField.layer.borderColor = Define.colorWidth
        valueBTextField.layer.cornerRadius = Define.borderRadius
    }
    
    @IBAction private func operateButtonTouchUpInside(_ sender: Any) {
        showCustomView()
    }
    
    @objc private func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        valueATextField.resignFirstResponder()
        valueBTextField.resignFirstResponder()
    }
}

extension ViewController {
    private struct Define {
        static var borderWitdth: CGFloat = 1.0
        static var colorWidth: CGColor = UIColor.green.cgColor
        static var borderRadius: CGFloat = 10
        static var durationAnimation: CGFloat = 0.4
        static var delayAnimation: CGFloat = 0
    }
}

extension ViewController: CalculatorDelegate {
    func view(view: Calculator, needPerform action: Calculator.Action) {
        switch action {
        case .sendData(operate: let operate):
            hideCustomView()
            fillOperateButton.setTitle(operate, for: .normal)
        case .clearData:
            hideCustomView()
            valueATextField.text = ""
            valueBTextField.text = ""
            fillOperateButton.setTitle("?", for: .normal)
        case .cancelView:
            hideCustomView()
        }
    }
}

extension ViewController: CalculatorDataSource {
    func getX() -> String {
        valueATextField.text ?? "0.0"
    }
    
    func getY() -> String {
        valueBTextField.text ?? "0.0"
    }
}

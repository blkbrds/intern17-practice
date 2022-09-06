//
//  Bai2ViewController.swift
//  CustomView
//
//  Created by luong.tran on 24/08/2022.
//

import UIKit


final class Bai2ViewController: UIViewController {

    @IBOutlet private weak var numberTextField: UITextField!

    var value: String?
    let nib = Bundle.main.loadNibNamed("MySlideView", owner: Bai2ViewController.self, options: nil)?.first as? MySlideView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        guard let nib = nib else { return }
        nib.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        nib.delegate = self
        nib.dataSource = self
        view.addSubview(nib)
    }
    
    @objc private func tap(_ sender: UITapGestureRecognizer) {
        dismissKeyboard()
    }
    
    private func configView(){
        numberTextField.delegate = self
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    private func updateValue() {
        guard let value = value,
              let _ = Int(value) else {
            return
        }
    }

    private func showKeyboard() {
        numberTextField.becomeFirstResponder()
    }

    private func dismissKeyboard() {
        numberTextField.resignFirstResponder()
    }
}

//Bước 4: Implement Protocol
extension Bai2ViewController: UITextFieldDelegate, MySlideViewDelegate {
    func view(view: MySlideView, needPerform action: MySlideView.Action) {
        switch action {
        case .updateThumb(thumbIndex: let thumbIndex):
            numberTextField.text = String(thumbIndex)
        }
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let numberString = textField.text,
              let number = Int(numberString) else { return }
        if number > 100 || number < 0{
            textField.text = "0"
        }else{
            guard let nib = nib else { return }
            nib.dataSource = self
            updateValue()
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        showKeyboard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
}

extension Bai2ViewController: MySlideViewDataSource {
    func getValueTextField() -> Int {
        guard let numberString = numberTextField.text,
              let number = Int(numberString) else { return 0}
        return number
    }
}

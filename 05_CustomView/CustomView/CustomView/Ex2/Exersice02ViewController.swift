//
//  Exersice02ViewController.swift
//  CustomView
//
//  Created by tri.nguyen on 04/04/2022.
//

import UIKit

final class Exersice02ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var valueTextField: UITextField!
    
    // MARK: - Properties
    private var mySliderView = MySliderView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Exercise02"
        mySliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as! MySliderView
        mySliderView.frame = CGRect(x: 15, y: 125, width: view.frame.width, height: view.frame.height)
        mySliderView.delegate = self
        valueTextField.delegate = self
        valueTextField.textAlignment = .center
        view.addSubview(mySliderView)
    }
}

// MARK: - Exention MySliderDelegate And UITextFieldDelegate
extension Exersice02ViewController: MySliderDelegate {
    func mySliderView(view: MySliderView, needsPerform action: MySliderView.Action) {
        switch action {
        case .changeValueSlider(value: let value):
            valueTextField.text = "\(value)"
        }
    }
}

extension Exersice02ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let value = Int(valueTextField.text ?? "0") else { return false }
        if value > 100 || value < 0 {
            valueTextField.text = "Error"
        } else {
            // Todo:
            mySliderView.value = value
        }
        
        return true
    }
}

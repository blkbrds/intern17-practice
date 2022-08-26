//
//  Bai4ViewController.swift
//  CustomView
//
//  Created by luong.tran on 25/08/2022.
//

import UIKit

final class Bai4ViewController: UIViewController {

    @IBOutlet weak var tfDate: UITextField!
    @IBOutlet weak var btnShowDate: UIButton!
    
    var datePicker = DatePickerView()
    
    let nib = Bundle.main.loadNibNamed("DatePickerView", owner: Bai4ViewController.self, options: nil)?.first as? DatePickerView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let nib = nib else { return }
        nib.frame = CGRect(x: view.frame.minX, y: view.frame.midY, width: view.frame.width, height: 500)
        nib.delegate = self
        view.addSubview(nib)
    }
    
    
    @IBAction func actionShowDate(_ sender: Any) {
        UIView.animate(withDuration: 0.4, delay: 0 , options: .curveEaseOut, animations: { [self] in
            nib!.frame = CGRect(x: view.frame.minX, y: view.frame.midY, width: view.frame.width, height: 500)
        }, completion: nil)
    }
}

extension Bai4ViewController: DatePickerViewDelegate, UITextFieldDelegate{
    func updateDatePicker(view: DatePickerView, data: String) {
        tfDate.text = data
        UIView.animate(withDuration: 0.4, delay: 0 , options: .curveEaseOut, animations: { [self] in
            nib!.frame = CGRect(x: view.frame.minX, y: view.frame.maxY, width: view.frame.width, height: 500)
        }, completion: nil)
        print(data)
    }
}

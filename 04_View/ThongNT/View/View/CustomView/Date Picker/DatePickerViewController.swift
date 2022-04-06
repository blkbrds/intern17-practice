//
//  DatePickerViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/1/22.
//

import UIKit

final class DatePickerViewController: UIViewController {
    
    //MARK: - Private Variables
    private var datePickerView: DatePickerCustomView?
    
    //MARK: - IBOutlet Private Variables
    @IBOutlet private weak var showDateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        loadNib()
    }
    
    private func loadNib() {
        guard let datePicker = Bundle.main
                .loadNibNamed("DatePickerCustomView", owner: self, options: nil)?.first as? DatePickerCustomView else { return }
        guard let tabbar = tabBarController?.tabBar else { return }
        let datePickerPoint = CGPoint(x: view.bounds.minX,
                                      y: view.frame.size.height - (view.bounds.height / 3) - tabbar.frame.height)
        let datePickerSize = CGSize(width: view.bounds.width,
                                    height: view.bounds.height / 3)
        datePickerView = datePicker
        datePickerView?.delegate = self
        datePickerView?.frame = CGRect(origin: datePickerPoint, size: datePickerSize)
        view.addSubview(datePicker)
    }
    
    private func showView() {
        UIView.animate(withDuration: 1) {
            self.datePickerView?.alpha = 1
        }
    }
    
    private func hideView() {
        UIView.animate(withDuration: 1) {
            self.datePickerView?.alpha = 0
        }
    }
    
    @IBAction private func textFieldDidTouch(_ sender: UITextField) {
        showView()
    }
}

// MARK: - Extension Delegate
extension DatePickerViewController: DataPickerViewDelegate {
    func sendDate(in view: DatePickerCustomView, mydate: Date, isHide: Bool) {
        showDateTextField.text = "\(mydate)"
        isHide ? hideView() : showView()
    }
}

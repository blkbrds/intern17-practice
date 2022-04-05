//
//  MySliderViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/1/22.
//

import UIKit

final class MySliderViewController: UIViewController {
    
    //MARK: - IBOutlet Private variables
    @IBOutlet private weak var valueTextField: UITextField!
    private var changeValue: Float = 0
    private var sliderView: CustomSliderView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: - Private functions
    private func setupUI() {
        valueTextField.text = "50"
        loadNib()
    }
    
    private func loadNib() {
        guard let sliderView = Bundle.main.loadNibNamed("CustomSliderView", owner: self, options: nil)?.first as? CustomSliderView else { return }
        
        let origin = CGPoint(x: view.bounds.midX - 75, y: view.bounds.midY - 150)
        sliderView.frame = CGRect(x: origin.x, y: origin.y, width: 150, height: 300)
        sliderView.delegate = self
        sliderView.dataSource = self
        view.addSubview(sliderView)
        self.sliderView = sliderView
    }
    
    @IBAction func changeValue(_ sender: Any) {
        guard let changeValue = valueTextField.text,
        let newValue = Float(changeValue) else { return }
        self.changeValue = newValue
        sliderView?.setThumbPosistionBaseOnSet()
    }
}

extension MySliderViewController: CustomSliderViewDelegate,
                                  CustomSliderViewDataSource {
    func getChangeValue(view: CustomSliderView) -> Float {
        if changeValue < 0 {
            return 0
        }
        if changeValue > 100 {
            return 100
        }
        return changeValue
    }
    
    func didChangeValue(view: CustomSliderView, value: Int) {
        valueTextField.text = String(value)
    }
    
}

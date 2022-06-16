//
//  SliderViewController.swift
//  BaiTap2
//
//  Created by tu.le2 on 16/06/2022.
//

import UIKit

final class SliderViewController: UIViewController {
    @IBOutlet private weak var valueView: UIView!
    @IBOutlet private weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        let sliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView
        sliderView?.frame = CGRect(x: view.bounds.midX, y: 200, width: 106, height: 564)
        sliderView?.delegate = self
        view.addSubview(sliderView!)
        valueView.layer.borderWidth = 2
    }
}
extension SliderViewController: MySliderViewDelegate {
    func valueNow(view: MySliderView, value: Int) {
        valueLabel.text = String(value)
    }
}

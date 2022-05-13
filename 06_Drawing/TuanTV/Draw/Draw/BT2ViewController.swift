//
//  BT2ViewController.swift
//  Draw
//
//  Created by Tuan Tran V. VN.Danang on 5/13/22.
//

import UIKit

class BT2ViewController: UIViewController {
    
    var pieChartView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        let widthView = view.frame.width
        let pieChartView = PieChart(frame: CGRect(x: widthView / 4, y: 100, width: widthView / 2, height: widthView / 2))
        pieChartView.itemsValue = [40.5, 30.6, 79, 37]
        pieChartView.itemsColor = [.black, .yellow, .brown, .orange]
        view.addSubview(pieChartView)
    }
}

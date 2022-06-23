//
//  PieChartViewController.swift
//  Drawing
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/23/22.
//

import UIKit

final class PieChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configView()
    }
    
    private func configView() {
        let pieChartView = PieChartView()
        pieChartView.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 300)
        pieChartView.segments = [
            Segment(color: UIColor(red: 1.00, green: 0.36, blue: 0.54, alpha: 1.00), value: 20),
            Segment(color: UIColor(red: 1.00, green: 0.44, blue: 0.59, alpha: 1.00), value: 30),
            Segment(color: UIColor(red: 1.00, green: 0.52, blue: 0.63, alpha: 1.00), value: 25),
            Segment(color: UIColor(red: 1.00, green: 0.60, blue: 0.67, alpha: 1.00), value: 40),
            Segment(color: UIColor(red: 0.98, green: 0.69, blue: 0.74, alpha: 1.00), value: 35),
            Segment(color: UIColor(red: 1.00, green: 0.28, blue: 0.49, alpha: 1.00), value: 55)
        ]
        view.addSubview(pieChartView)
    }
}

//
//  ViewController.swift
//  Drawing
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/23/22.
//

import UIKit

final class PieChartViewController: UIViewController {

    override func viewDidLoad() {
        let pieChartView = PieChartView()
        pieChartView.frame = CGRect(x: 0, y: 250, width: view.frame.size.width, height: 300)
        pieChartView.segments = [
            Segment(color: .red, value: 15),
            Segment(color: .blue, value: 30),
            Segment(color: .green, value: 45),
            Segment(color: .yellow, value: 60),
            Segment(color: .purple, value: 75)
        ]
        view.addSubview(pieChartView)
    }
}

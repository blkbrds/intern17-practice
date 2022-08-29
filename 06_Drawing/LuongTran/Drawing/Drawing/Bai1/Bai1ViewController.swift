//
//  Bai1ViewController.swift
//  Drawing
//
//  Created by luong.tran on 26/08/2022.
//

import UIKit

class Bai1ViewController: UIViewController {
    
    lazy var barChartView: ColumnChartView = {
        let barChartView = ColumnChartView()
        barChartView.frame = view.frame
        return barChartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        barChartView.dataEntries =
        [
            BarEntry(score: 45, title: "Monday"),
            BarEntry(score: 35, title: "Tuesday"),
            BarEntry(score: 55, title: "Wednesday"),
            BarEntry(score: 3, title: "Thursday"),
            BarEntry(score: 10, title: "Friday")
        ]
        view.addSubview(barChartView)
    }

}

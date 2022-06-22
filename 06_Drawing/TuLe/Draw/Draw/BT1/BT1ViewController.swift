//
//  BT1ViewController.swift
//  Draw
//
//  Created by tu.le2 on 21/06/2022.
//

import UIKit

class BT1ViewController: UIViewController {

    lazy var barChartView: BarChartView = {
          let barChartView = BarChartView()
          barChartView.frame = view.frame
          return barChartView
       }()
       override func viewDidLoad() {
          super.viewDidLoad()
          barChartView.dataEntries =
             [
                BarEntry(score: 98, title: "105"),
                BarEntry(score: 95, title: "90"),
                BarEntry(score: 103, title: "75"),
                BarEntry(score: 101, title: "60"),
                BarEntry(score: 99, title: "45"),
                BarEntry(score: 97, title: "30"),
                BarEntry(score: 98, title: "15")
             ]
          view.addSubview(barChartView)
      }
}

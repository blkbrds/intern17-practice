//
//  BT5ViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/25/22.
//

import UIKit

final class BT5ViewController: UIViewController {
    var arrBarChart: [BarChart] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
        setupView()

        // Do any additional setup after loading the view.
    }
    
    func prepareData() {
        arrBarChart = [BarChart(time: "Jan", value: 20)
                       ,BarChart(time: "Feb", value: 4)
                       ,BarChart(time: "Mar", value: 6)
                       ,BarChart(time: "Apr", value: 3)
                       ,BarChart(time: "May", value: 12)
                       ,BarChart(time: "Jun", value: 16)
                       ,BarChart(time: "Jul", value: 4)
                       ,BarChart(time: "Aug", value: 18)
                       ,BarChart(time: "Sep", value: 2)
                       ,BarChart(time: "Oct", value: 4)
                       ,BarChart(time: "Nov", value: 5)
                       ,BarChart(time: "Dec", value: 4)]
    }
    let viewChart = UIView()
    func setupView() {
        view.backgroundColor = .lightGray
        
        let widthView = view.frame.width
        let heightView = view.frame.height
        let widthBar = 20
        let chartFrame = CGRect(x: 40, y: 100, width: widthView - 80, height: heightView - 150)
        viewChart.frame = chartFrame
        viewChart.backgroundColor = .white
        view.addSubview(viewChart)
        var x = 0
        let space = (Int(viewChart.frame.width) - 12 * widthBar) / 11
        
        for i in 0...11 {
            let viewBar = UIView(frame: CGRect(x: x, y: Int(viewChart.frame.height), width: widthBar, height: -1 * convertValue(a: arrBarChart[i].value)))
            viewBar.backgroundColor = .orange
            
            let lbValue = UILabel(frame: CGRect(x: x, y: Int(viewChart.frame.height) - convertValue(a: arrBarChart[i].value) - 20 , width: widthBar, height: 20))
            lbValue.text = String(arrBarChart[i].value)
            lbValue.textAlignment = .center
//            lbValue.backgroundColor = .blue
            lbValue.font = UIFont.systemFont(ofSize: 10)
            
            let lbTime = UILabel(frame: CGRect(x: x, y: Int(viewChart.frame.height), width: widthBar, height: 20))
            lbTime.backgroundColor = .red
            lbTime.textAlignment = .center
            lbTime.font = UIFont.systemFont(ofSize: 10)
            if i % 2 != 0 {
                lbTime.text = String(arrBarChart[i].time)
            }
            
            viewChart.addSubview(lbTime)
            viewChart.addSubview(viewBar)
            viewChart.addSubview(lbValue)
            x = x + widthBar + Int(space)
            print(x)
        }
    }
    
    func convertValue(a : Int)  -> Int {
        return a * Int(viewChart.frame.height) / 22
    }

}
struct BarChart {
    var time: String = "Jan"
    var value: Int = 20
    
}

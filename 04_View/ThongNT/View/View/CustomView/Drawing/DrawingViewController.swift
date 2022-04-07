//
//  DrawingViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/5/22.
//

import UIKit

struct IncomeValue {
    var year: Int = 0
    var mount: Int = 0
}

final class DrawingViewController: UIViewController {
    
    //MARK: - Private variable
    private let values: [IncomeValue] = [IncomeValue(year: 2010, mount: 5),
                                         IncomeValue(year: 2011, mount: 8),
                                         IncomeValue(year: 2012, mount: 5),
                                         IncomeValue(year: 2013, mount: 10),
                                         IncomeValue(year: 2014, mount: 7),
                                         IncomeValue(year: 2015, mount: 8),
                                         IncomeValue(year: 2016, mount: 11),
                                         IncomeValue(year: 2017, mount: 10),
                                         IncomeValue(year: 2018, mount: 11),
                                         IncomeValue(year: 2019, mount: 10),
                                         IncomeValue(year: 2020, mount: 8),
                                         IncomeValue(year: 2021, mount: 9)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        guard let columnChartView = Bundle.main.loadNibNamed("ColumnChartView",
                                                             owner: self, options: nil)?.first as? ColumnChartView else { return }
        guard let tabbarHeight = tabBarController?.tabBar.frame.size.height else { return }
        let frame = CGRect(x: view.bounds.minX,
                           y: view.bounds.midY - tabbarHeight,
                           width: view.bounds.width,
                           height: view.bounds.height / 5)
        columnChartView.datasource = self
        columnChartView.frame = frame
        columnChartView.draw(frame)
        view.addSubview(columnChartView)
    }
}

extension DrawingViewController: ColumnChartViewDataSource {
    func getPoints(in view: ColumnChartView) -> [IncomeValue] {
        return values
    }
}

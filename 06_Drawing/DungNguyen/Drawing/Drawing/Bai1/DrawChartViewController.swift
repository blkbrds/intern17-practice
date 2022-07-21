//
//  DrawChartViewController.swift
//  Drawing
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/22/22.
//

import UIKit

final class DrawChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let view = DrawChartView(frame: CGRect(x: 30, y: 50, width: screenSize.width - 60, height: 300))
        self.view.addSubview(view)
    }
}

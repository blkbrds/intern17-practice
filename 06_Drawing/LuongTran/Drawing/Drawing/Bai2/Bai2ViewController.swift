//
//  Bai2ViewController.swift
//  Drawing
//
//  Created by luong.tran on 29/08/2022.
//

import UIKit

class Bai2ViewController: UIViewController {

    var circularProgressBarView: CircleChart!
    var circularViewDuration: TimeInterval = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpCircularProgressBarView()
    }

    func setUpCircularProgressBarView() {
        // set view
        circularProgressBarView = CircleChart(frame: CGRect(x: 250, y: 250, width: 250, height: 250))
        circularProgressBarView.center = view.center
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
        self.view.addSubview(circularProgressBarView)
    }
}

//
//  ColumnChartViewController.swift
//  Drawing
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/22/22.
//

import UIKit

final class ColumnChartViewController: UIViewController {
    
    let values: [Int] = [100, 500 , 145, 1000]
    let frame = CGRect(x: 50, y: 250, width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.height - 300)
    var height: Int = 0
    var lineView = DrawLineView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateSizeHeight()
        drawLine()
        drawColumn()
        addLabel()
    }

    private func drawLine() {
        var b = frame.height
        lineView = DrawLineView(frame: frame) //UIView
        lineView.backgroundColor = .blue
        lineView.clipsToBounds = false
        for _ in 0...3 {
            lineView.drawLine(start: CGPoint(x: 0, y: b), end: CGPoint(x: frame.width , y: b))
            view.addSubview(lineView)
            b -= frame.height / 3
        }
    }

    private func drawColumn() {
        var x: CGFloat = 50
        for i in 0..<values.count {
            let heightColumn: Float = Float(values[i]) * Float(lineView.bounds.size.height) / Float(height)
            let frame1 = CGRect(x: x, y: lineView.bounds.size.height - CGFloat(heightColumn), width: 30, height: CGFloat(heightColumn))
            let rectView = ColumnView(frame: frame1)
            lineView.addSubview(rectView)
            x += 50
        }
    }

    private func addLabel() {
        for i in 0...3 {
            let heightLabel = (Float(1) - Float(i*100) / Float(3*100)) * Float(lineView.bounds.size.height)
            let label = UILabel(frame: CGRect(x: -40, y: CGFloat(heightLabel), width: 100, height: 50))
            label.text = "\(Int(i * height / 3))"
            label.center.y = CGFloat(heightLabel)
            lineView.addSubview(label)
        }
    }

    private func calculateSizeHeight() {
        height = Int(values.max() ?? 0) + 150
    }
}

//
//  PieChart.swift
//  Draw
//
//  Created by Tuan Tran V. VN.Danang on 5/13/22.
//

import UIKit

final class PieChart: UIView {
    private let pi: Float = 3.14
    private var originPieChart = CGPoint()
    var x: CGFloat = 0
    
    var itemsValue: [Float] = [] {
        willSet {
            setNeedsDisplay()
        }
    }
    
    private var sumValueOfItems: Float {
        get {
            return itemsValue.reduce(0, +)
        }
    }
    
    var itemsColor: [UIColor] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        originPieChart = CGPoint(x: frame.width / 2, y: frame.width / 2)
        x = frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        var startAngle: Float = 0
        var endAngle: Float = 0
        for i in 0..<itemsValue.count {
            endAngle =  endAngle + itemsValue[i] * 2 * pi / sumValueOfItems
            let context = UIGraphicsGetCurrentContext()
            context?.setLineWidth(1)
            context?.setStrokeColor(itemsColor[Int(i)].cgColor)
            context?.move(to: originPieChart)
            context?.addArc(center: originPieChart, radius: x, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: false)
            context?.addLine(to: originPieChart)
            context?.setFillColor(itemsColor[Int(i)].cgColor)
            context?.fillPath()
            startAngle = endAngle
        }
    }
}

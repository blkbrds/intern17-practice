//
//  PieChartView.swift
//  Drawing
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/23/22.
//

import UIKit

struct Segment {

    var color: UIColor
    var value: CGFloat
}

final class PieChartView: UIView {
    
    var segments = [Segment]() {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        let current = UIGraphicsGetCurrentContext()
        let radius = min(frame.size.width, frame.size.height) * 0.5
        let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let valueCount = segments.reduce(0, {$0 + $1.value})
        var startAngle = -CGFloat.pi * 0.5
        for segment in segments {
            guard let current = current else {
                return
            }
            current.setFillColor(segment.color.cgColor)
            let endAngle = startAngle + 2 * .pi * (segment.value / valueCount)
            current.move(to: viewCenter)
            current.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            current.fillPath()
            startAngle = endAngle
        }
    }

}

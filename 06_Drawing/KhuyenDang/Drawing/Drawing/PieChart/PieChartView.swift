//
//  PieChartView.swift
//  Drawing
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/23/22.
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
    
    //MARK: - override func
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        let current = UIGraphicsGetCurrentContext()
        let radius = min(frame.size.width, frame.size.height) / 2
        let viewCenter = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let valueCount = segments.compactMap{$0.value}.reduce(0, +)
        var startAngle = -CGFloat.pi / 2
        
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

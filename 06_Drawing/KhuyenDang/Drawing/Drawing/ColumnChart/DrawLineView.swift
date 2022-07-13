//
//  drawLine.swift
//  Drawing
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/22/22.
//

import UIKit

final class DrawLineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    func drawLine(start: CGPoint, end: CGPoint) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = path.cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
}

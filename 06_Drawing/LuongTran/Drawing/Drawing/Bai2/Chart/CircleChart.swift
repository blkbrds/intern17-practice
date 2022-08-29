//
//  CircleChart.swift
//  Drawing
//
//  Created by luong.tran on 29/08/2022.
//

import UIKit

class CircleChart: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func createCircularPath() {
        // created circularPath for circleLayer and progressLayer
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 80, startAngle: Define.startPoint, endAngle: Define.endPoint, clockwise: true)
        // circleLayer path defined to circularPath
        Define.circleLayer.path = circularPath.cgPath
        // ui edits
        Define.circleLayer.fillColor = UIColor.clear.cgColor
        Define.circleLayer.lineCap = .round
        Define.circleLayer.lineWidth = 20.0
        Define.circleLayer.strokeEnd = 1.0
        Define.circleLayer.strokeColor = UIColor.white.cgColor
        // added circleLayer to layer
        layer.addSublayer(Define.circleLayer)
        // progressLayer path defined to circularPath
        Define.progressLayer.path = circularPath.cgPath
        // ui edits
        Define.progressLayer.fillColor = UIColor.clear.cgColor
        Define.progressLayer.lineCap = .round
        Define.progressLayer.lineWidth = 10.0
        Define.progressLayer.strokeEnd = 0
        Define.progressLayer.strokeColor = UIColor.green.cgColor
        let textValue = UILabel(frame: CGRect(x: 0, y: self.frame.height / 2, width: self.frame.width, height: 15))
        textValue.text = "100%"
        textValue.font = UIFont.boldSystemFont(ofSize: 20.0)
        textValue.textAlignment = .center
        textValue.textColor = .white
        self.addSubview(textValue)
        // added progressLayer to layer
        layer.addSublayer(Define.progressLayer)
    }
    
    
    func progressAnimation(duration: TimeInterval) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        Define.progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}

extension CircleChart {
    private struct Define {
        static var circleLayer = CAShapeLayer()
        static var progressLayer = CAShapeLayer()
        static var startPoint = CGFloat(-Double.pi / 2)
        static var endPoint = CGFloat(3 * Double.pi / 2)
    }
}
